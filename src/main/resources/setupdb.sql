
CREATE TABLE alert
(
  identifier character(30),
  sender character(100),
  sent timestamp without time zone,
  status character(10),
  "msgType" character(10),
  scope character(10),
  "references" character(200),
  "info-category" character(10),
  "info-event" character(10),
  "info-urgency" character(10),
  "info-severity" character(10),
  "info-certainty" character(10),
  "senderName" character(200),
  "info-headline" character(100),
  "info-description" character(200),
  "info-web" character(256),
  "info-areaDesc" character(200),
  "info-area-geometry" character(500)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE alert
  OWNER TO postgres;
