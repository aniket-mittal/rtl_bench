module rtlpp_09486(
  input clk, reset, one, two, five,
  output reg d, 
  output reg [2:0] r
);

parameter cents0 = 3'b000, cents1 = 3'b001, cents2 = 3'b010, cents3 = 3'b011, cents4 = 3'b100;
reg [2:0] cs, ns;

always @(cs or one or two or five) begin 
  case (cs)
    cents0: begin
      if (one) ns = cents1;
      else if (two) ns = cents2;
      else ns = cs;
    end
    cents1: begin
      if (one) ns = cents2;
      else if (two) ns = cents3;
      else if (five) ns = cents0;
      else ns = cs;
    end
    cents2: begin
      if (one) ns = cents3;
      else if (two) ns = cents4;
      else if (five) ns = cents0;
      else ns = cs;
    end
    cents3: begin
      if (one) ns = cents4;
      else if (two | five) ns = cents0;
      else ns = cs;
    end
    cents4: begin
      if (one | two | five) ns = cents0;
      else ns = cs;
    end
    default: ns = cents0;
  endcase
end

always @(cs or one or two or five) begin 
  case (cs)
    cents0: begin
      if (five) d = 1;
      else d = 0;
      r = 0;
    end
    cents1: begin
      if (five) begin
        d = 1;
        r = 1;
      end
      else begin 
        d = 0;
        r = 0;
      end
    end
    cents2: begin
      if (five) begin
        d = 1;
        r = 2;
      end
      else begin 
        d = 0;
        r = 0;
      end
    end
    cents3: begin
      if (two) begin
        d = 1;
        r = 0;
      end
      else if (five) begin
        d = 1;
        r = 3;
      end
      else begin 
        d = 0;
        r = 0;
      end
    end
    cents4: begin
      if (one) begin
        d = 1;
        r = 0;
      end
      else if (two) begin
        d = 1;
        r = 1;
      end
      else if (five) begin
        d = 1;
        r = 4;
      end
      else begin 
        d = 0;
        r = 0;
      end
    end
    default: begin
      d = 0;
      r = 0;
    end
  endcase
end

always @(posedge clk or posedge reset) begin 
  if (reset)
    cs <= cents0;
  else
    cs <= ns;
end

endmodule