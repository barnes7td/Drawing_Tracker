ActiveRecord::Base.connection.execute("select p.id project_id, count('a') drawings_ready from projects p join drawings d on (p.id = d.project_id) where d.status = 'ready' group by p.name order by count('a') DESC")





Project.joins(:drawings).select('projects.id, project_id, count('a'), no_drawings').group(name).order(d_count)

Project.joins(:drawings).select("projects.id, drawings.project_id, count('a')").merge(Drawing.where(status: "ready")).group(:name).order("count('a') DESC")

Project.joins(:drawings).select("projects.*, drawings.project_id, count('a')").merge(Drawing.where(status: "ready")).group(:name).order("count('a') DESC")
