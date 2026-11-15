module rtlpp_10471 (clk, r_in, phi_in, x_out, y_out, eps); 

  parameter W = 8;  
  input        clk;
  input  [W:0] r_in, phi_in;
  output [W:0] x_out, y_out, eps;
  reg    [W:0] x_out, y_out, eps;
  
  reg    [W:0] x0, y0, z0; 
  reg    [W:0] x1, y1, z1; 
  reg    [W:0] x2, y2, z2; 
  reg    [W:0] x3, y3, z3; 

  always @(posedge clk) begin 
    if (phi_in > 9'd90) begin                   
      x0 <= 0;                 
      y0 <= r_in;              
      z0 <= phi_in - 9'd90;
    end
    else if ((phi_in > 9'd331) && (phi_in < 9'd423)) begin
      x0 <= 0;
      y0 <= -r_in;
      z0 <= phi_in + 9'd90;
    end
    else begin
      x0 <= r_in;
      y0 <= 0;
      z0 <= phi_in;
    end

    if (z0 > 0) begin
      x1 <= x0 - y0;
      y1 <= y0 + x0;
      z1 <= z0 - 9'd45;
    end
    else begin
      x1 <= x0 + y0;
      y1 <= y0 - x0;
      z1 <= z0 + 9'd45;
    end

    if (z1 > 0) begin
      x2 <= x1 - {y1[W], y1[W:1]}; 
      y2 <= y1 + {x1[W], x1[W:1]}; 
      z2 <= z1 - 9'd26;
    end
    else begin
      x2 <= x1 + {y1[W], y1[W:1]}; 
      y2 <= y1 - {x1[W], x1[W:1]}; 
      z2 <= z1 + 9'd26;
    end

    if (z2 > 0) begin
      x3 <= x2 - {y2[W], y2[W], y2[W:2]}; 
      y3 <= y2 + {x2[W], x2[W], x2[W:2]}; 
      z3 <= z2 - 9'd14;
    end
    else begin
      x3 <= x2 + {y2[W], y2[W], y2[W:2]}; 
      y3 <= y2 - {x2[W], x2[W], x2[W:2]}; 
      z3 <= z2 + 9'd14;
    end

    x_out <= x3;
    eps   <= z3;
    y_out <= y3;
  end                

endmodule