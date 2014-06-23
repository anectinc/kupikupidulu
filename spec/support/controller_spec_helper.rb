module ControllerSpecHelper
  def ignore_exception
    begin
      yield
    rescue
    end
  end
end
