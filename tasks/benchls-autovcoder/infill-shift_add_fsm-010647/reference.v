module autovcoder_010647 (
    Start,
    Done,
    state0,
    state1,
    nstate0,
    nstate1,
    SubCount,
    CountRst,
    accRst,
    accLd,
    Bld,
    Ald,
    biRst,
    Ready,
    Shift
);

  input Start;
  input Done;

  input state0;
  input state1;
  output nstate0;
  output nstate1;

  //reg nstate0;
  //reg nstate1;

  output accRst;
  output accLd;
  output Bld;
  output Ald;
  output biRst;
  output Ready;
  output Shift;
  output CountRst;
  output SubCount;

  // calculating the next state
  /*
    always @(*)
      begin
        nstate1 = 1'b0;
        nstate0 = 1'b0;     
        case ({ state1, state0 })
          2'b00: begin 
                   if ( Start )
                     begin
                       nstate1 = 1'b0;
                       nstate0 = 1'b1;
                     end
                 end
                 
          2'b01: begin
                   if ( !Done )
                     begin
                       nstate1 = 1'b1;
                       nstate0 = 1'b0;
                     end
                   else
                     begin
                       nstate1 = 1'b0;
                       nstate0 = 1'b0;   
                     end
                 end
                 
          2'b10: begin
                   if ( !Done )
                     begin
                       nstate1 = 1'b0;
                       nstate0 = 1'b1;
                     end
                   else
                     begin
                       nstate1 = 1'b0;
                       nstate0 = 1'b0;
                     end
                 end
                  
          default: begin
                     nstate1 = state1;
                     nstate0 = state0;             
                   end
        endcase   
      end
    */

  assign nstate1  = (state0 & ~Done);
  assign nstate0  = ((state1 & ~Done) | (~state1 & ~state0 & Start));

  // output 
  assign accRst   = (~state1 & ~state0 & Start);
  assign accLd    = (state0 & ~Done);
  assign Bld      = (~state1 & ~state0 & Start);
  assign Ald      = (~state1 & ~state0 & Start);
  assign biRst    = (~state1 & ~state0 & Start);
  assign Ready    = ((state1 & Done) | (state0 & Done) | (~state1 & ~state0 & ~Start));
  assign Shift    = (state1 & ~Done);
  assign CountRst = (Done);
  assign SubCount = (state1 & ~Done);


endmodule

