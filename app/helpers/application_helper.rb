module ApplicationHelper
	def show_journal_bg
		"background-image: linear-gradient(0deg, #000 -25%, transparent 99.9%),
		url(#{@journal.journal_image});
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
		min-width: 100%;
		min-height: 26rem;"
  end
end
