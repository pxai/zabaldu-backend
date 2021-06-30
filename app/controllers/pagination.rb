module Pagination
    def set_offset
        if params[:page] && params[:page].to_i >= 0
          params[:page].to_i
        else
          0
        end
    end

    def page_size
        10
    end
end