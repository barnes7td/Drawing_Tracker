#Drawing Tracker

##Purpose:
Create an app that can collect and organize drawings recieved for a project. There are at least 2 kinds of drawings: Erection drawings and Piece drawings. Drawings will have a revision number starting with 0 with the ability to increment. Drawings will be gradually added to the project through drawing "batches". The batches need to operate like a transaction updating current drawings revision number, adding new, and deleting no longer used drawings. The app needs to associate drawings to an area in the construction site. The app needs to mark the drawings when "released for fabrication" (release).

Once drawings are input a user will need to see:

1. All drawings related to an area.
1. All drawings released related to an area.
1. Current drawing revisions of all drawings associated to an area.
1. Each drawing, with all batches that updated it and area associated.
1. See all drawings associated to an array of drawing batches.
1. A list of all batches up to date.
1. A list of all areas.
1. A list of all drawings.

User will need to be able to:

1. Input (create) a batch of drawings, easily
1. Edit a batch of drawings
1. Create a release of drawings
1. Edit a release of drawings
