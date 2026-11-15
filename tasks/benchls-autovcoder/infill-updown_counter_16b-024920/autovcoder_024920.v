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

  [MASKED]

endmodule

