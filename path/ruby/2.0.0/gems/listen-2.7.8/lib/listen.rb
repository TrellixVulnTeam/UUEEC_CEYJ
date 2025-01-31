require 'celluloid'
require 'listen/listener'

module Listen
  class << self
    # Listens to file system modifications on a either single directory or
    # multiple directories.
    #
    # When :forward_to is specified, this listener will broadcast modifications
    # over TCP.
    #
    # @param (see Listen::Listener#new)
    #
    # @yield [modified, added, removed] the changed files
    # @yieldparam [Array<String>] modified the list of modified files
    # @yieldparam [Array<String>] added the list of added files
    # @yieldparam [Array<String>] removed the list of removed files
    #
    # @return [Listen::Listener] the listener
    #
    def to(*args, &block)
      Celluloid.boot unless Celluloid.running?
      options = args.last.is_a?(Hash) ? args.last : {}
      if target = options.delete(:forward_to)
        _add_listener(target, :broadcaster, *args, &block)
      else
        _add_listener(*args, &block)
      end
    end

    # Stop all listeners & Celluloid
    #
    # Use it for testing purpose or when you are sure that Celluloid could be
    # ended.
    #
    # This is used by the `listen` binary to handle Ctrl-C
    #
    def stop
      @listeners ||= []
      @listeners.each do |listener|
        # call stop to halt the main loop
        listener.stop
      end

      Celluloid.shutdown
    end

    # Listens to file system modifications broadcast over TCP.
    #
    # @param [String/Fixnum] target to listen on (hostname:port or port)
    #
    # @yield [modified, added, removed] the changed files
    # @yieldparam [Array<String>] modified the list of modified files
    # @yieldparam [Array<String>] added the list of added files
    # @yieldparam [Array<String>] removed the list of removed files
    #
    # @return [Listen::Listener] the listener
    #
    def on(target, *args, &block)
      _add_listener(target, :recipient, *args, &block)
    end

    private

    def _add_listener(*args, &block)
      @listeners ||= []
      Listener.new(*args, &block).tap do |listener|
        @listeners << listener
      end
    end
  end
end
