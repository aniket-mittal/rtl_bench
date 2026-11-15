module rtlpp_01461 (
  input rstb,
  input [7:0] tdata,
  input mlb, 
  input ss, 
  input sck, 
  input sdin,
  output reg tdata_re,
  output sdout,           
  output reg done,
  output reg [7:0] rdata
);

  reg [7:0] treg, rreg;
  reg [3:0] nb;
  wire sout;
  
  assign sout = mlb ? treg[7] : treg[0];
  assign sdout = (!ss) ? sout : 1'bz; 

  always @(posedge sck) begin
    if (rstb == 0) begin 
      rreg <= 8'h00;
    end else if (!ss) begin 
      if(mlb == 0) begin 
        rreg <= {sdin, rreg[7:1]};
      end else begin
        rreg <= {rreg[6:0], sdin};
      end 
    end 
  end

  always @(posedge sck) begin
    if (rstb == 0) begin 
      rdata <= 8'h00; 
      done <= 0; 
      nb <= 0;
    end else if (!ss) begin
      nb <= nb + 1;  
      if (nb != 7) begin 
        done <= 0;
      end else begin
        nb <= 0; 
        done <= 1; 
        rdata <= rreg; 
      end
    end 
  end

  always @(negedge sck) begin
    if (rstb == 0) begin
      tdata_re <= 1'b0; 
    end else if (!ss) begin
      if (nb == 0) begin
        tdata_re <= 1'b1;
      end else begin
        tdata_re <= 1'b0;
      end
    end 
  end 

  always @(negedge sck) begin
    if (rstb == 0) begin 
      treg <= 8'hFF;
    end else if (!ss) begin
      if (nb == 0) begin
        treg <= tdata;
      end else begin
        if (mlb == 0) begin 
          treg <= {1'b1, treg[7:1]}; 
        end else begin
          treg <= {treg[6:0], 1'b1};
        end
      end
    end 
  end 

endmodule