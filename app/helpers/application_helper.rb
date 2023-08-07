module ApplicationHelper
    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/flash"
    end

    def nested_dom_id(*args)
        args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
    end

    def admin?(user)
        user_signed_in? && user.role == "admin"
    end

    def authorized_user?(user)
        user_signed_in? && (user.role == "admin") || user.role == "editor"
    end
end
