create or replace function st_asdcmitext(geom geometry)
   returns text
   language plpgsql
  as
$$
declare
   dcmi_text text;
begin
  SELECT concat('westlimit=', st_xmin(geom), '; southlimit=', st_ymin(geom), '; eastlimit=', st_xmax(geom), '; northlimit=', st_ymax(geom)) INTO dcmi_text;
  
  RETURN dcmi_text;
end;
$$;
create or replace function st_asdcmitext(box box2d)
   returns text 
   language plpgsql
  as
$$
declare
   dcmi_text text;
begin
  SELECT concat('westlimit=', st_xmin(box), '; southlimit=', st_ymin(box), '; eastlimit=', st_xmax(box), '; northlimit=', st_ymax(box)) INTO dcmi_text;
  
  RETURN dcmi_text;
end;
$$;
create or replace function st_asdcmitext(box box3d)
   returns text
   language plpgsql
  as
$$
declare
   dcmi_text text;
begin
  SELECT concat('westlimit=', st_xmin(box), '; southlimit=', st_ymin(box), '; eastlimit=', st_xmax(box), '; northlimit=', st_ymax(box), '; uplimit=', st_zmax(box), '; downlimit=', st_zmin(box)) INTO dcmi_text;
  
  RETURN dcmi_text;
end;
$$;
