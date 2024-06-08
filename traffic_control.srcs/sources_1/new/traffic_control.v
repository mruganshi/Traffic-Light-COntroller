
 module traffic_light_controller(nr,ng,ny,sr,sg,sy,er,eg,ey,wr,wy,wg,clk,rst_a);
   output wire nr,ng,ny,sr,sg,sy,er,eg,ey,wr,wy,wg;
   reg [2:0] n_lights,s_lights,e_lights,w_lights;
   input      clk;
   input      rst_a;
 
   reg [2:0] state;
 
   parameter [2:0] north=3'b000;
   parameter [2:0] north_y=3'b001;
   parameter [2:0] south=3'b010;
   parameter [2:0] south_y=3'b011;
   parameter [2:0] east=3'b100;
   parameter [2:0] east_y=3'b101;
   parameter [2:0] west=3'b110;
   parameter [2:0] west_y=3'b111;

   reg [2:0] count;
 
   
   
   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state=north;
                count =3'b000;
            end
        else
            begin
                case (state)
                north :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b000;
                            state=north_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north;
                            end
                    end

                north_y :
                    begin
                        if (count==3'b011)
                            begin
                            count=3'b000;
                            state=south;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north_y;
                        end
                    end

               south :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b0;
                            state=south_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=south;
                        end
                    end

            south_y :
                begin
                    if (count==3'b011)
                        begin
                        count=3'b0;
                        state=east;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=south_y;
                        end
                    end

            east :
                begin
                    if (count==3'b111)
                        begin
                        count=3'b0;
                        state=east_y;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east;
                        end
                    end

            east_y :
                begin
                    if (count==3'b011)
                        begin
                        count=3'b0;
                        state=west;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east_y;
                        end
                    end

            west :
                begin
                    if (count==3'b111)
                        begin
                        state=west_y;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west;
                        end
                    end

            west_y :
                begin
                    if (count==3'b011)
                        begin
                        state=north;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west_y;
                        end
                    end
            endcase // case (state)
        end // always @ (state)
    end


always @(state)
     begin
         case (state)
            north :
                begin
                    n_lights = 3'b001;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: north

            north_y :
                begin
                    n_lights = 3'b010;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: north_y

            south :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b001;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: south

            south_y :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b010;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end // case: south_y

            west :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b001;
                end // case: west

            west_y :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b010;
                end // case: west_y

            east :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b001;
                    w_lights = 3'b100;
                end // case: east

            east_y :
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b010;
                    w_lights = 3'b100;
                end // case: east_y
            endcase // case (state)
     end // always @ (state)
    assign nr=n_lights[2];
    assign ny=w_lights[1];
    assign ng=n_lights[0];
    assign sr=s_lights[2];
    assign sy=n_lights[1];
    assign sg=s_lights[0];
    assign er=e_lights[2];
    assign ey=s_lights[1];
    assign eg=e_lights[0];
    assign wr=w_lights[2];
    assign wy=e_lights[1];
    assign wg=w_lights[0];
     
endmodule