module autovcoder_024920 (
    input sys_clk,
    input sys_rst,
    input dir,
    input load,
    input en,
    input [15:0] din,
    output [15:0] dout
);

  reg [15:0] cpt;

  task init;
    begin
      cpt <= 16'b0;
    end
  endtask

  initial begin
    init;
  end

  assign dout = cpt;

  reg len;

  always @(posedge sys_clk) begin
    //  len <= en;
    if (sys_rst == 1'b1) begin
      init;
    end else begin
      if (en == 1'b1) begin
        if (load == 1'b1) begin
          if (dir == 1'b1) begin
            cpt <= din;
          end else begin
            cpt <= din;
          end
        end else begin
          if (dir == 1'b1) begin
            cpt <= cpt + 16'h04;
          end else begin
            cpt <= cpt - 16'h04;
          end
        end
        //      // Negedge, this is an alea, readjust ip
        //    end else if (len == 1'b1) begin
        //      if (dir == 1'b1) begin
        //        cpt <= cpt - 16'h04;
        //      end else begin
        //        cpt <= cpt + 16'h04;
        //      end
      end
    end
  end

endmodule

