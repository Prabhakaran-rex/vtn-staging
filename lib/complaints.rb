module Complaints
  class Lighthouse
    def initialize
      @ticketConnector = TaskMapper.new(TASK_MAPPER[Rails.env]['provider'], {:token => TASK_MAPPER[Rails.env]['token'], :account => TASK_MAPPER[Rails.env]['account']})
      @project =  @ticketConnector.project.find(TASK_MAPPER[Rails.env]['project_id'])
    end

    def getTickets
      @project.tickets
    end

    def getProject
      @project
    end

    def addTicket(title, description, appraisal_id, user_id)
      tmTicket = @project.ticket!(:title => title, :description => description)
      if tmTicket
        t = Ticket.new(:user_id => user_id, :appraisal_id => appraisal_id, :task_mapper_id => tmTicket.id, :task_mapper_provider => TASK_MAPPER[Rails.env]['provider'])
        t.save
      end
      t
    end

    def getTicket(ticket_id)
      t = Ticket.find(ticket_id)
      unless t.nil?
        tmTicket = @project.tickets(:id => t.task_mapper_id).first
      end
    end

    def getComments(ticket_id)
      tmTicket = getTicket(ticket_id)
      unless tmTicket.nil?
        return tmTicket.comments
      end
    end

    def addCommentsToTicket(ticket_id, body)
      tmTicket = getTicket(ticket_id)
      unless t.nil?
        tmTicket.comment!(:body => body)
      end
    end
  end
end


