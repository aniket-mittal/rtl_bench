// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11156 dut (
    .clk(clk),
    .rst(in_vec[39:39]),
    .cmd_phy_addr(in_vec[38:34]),
    .cmd_reg_addr(in_vec[33:29]),
    .cmd_data(in_vec[28:13]),
    .cmd_opcode(in_vec[12:11]),
    .cmd_valid(in_vec[10:10]),
    .data_out_ready(in_vec[9:9]),
    .mdio_i(in_vec[8:8]),
    .prescale(in_vec[7:0]),
    .cmd_ready(out_vec[21:21]),
    .data_out(out_vec[20:5]),
    .data_out_valid(out_vec[4:4]),
    .mdc_o(out_vec[3:3]),
    .mdio_o(out_vec[2:2]),
    .mdio_t(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hacc934ecfb;
    stim[1] = 40'hc8240583c2;
    stim[2] = 40'h4df83df08f;
    stim[3] = 40'h4d17fa3caa;
    stim[4] = 40'h4ec8ab650f;
    stim[5] = 40'h7638abf8a8;
    stim[6] = 40'h12b89b5ae8;
    stim[7] = 40'h1571dadace;
    stim[8] = 40'h78d2f6bfd0;
    stim[9] = 40'h084b8e2b4a;
    stim[10] = 40'h6399113552;
    stim[11] = 40'h33a0b96391;
    stim[12] = 40'h01177aa2ca;
    stim[13] = 40'h6208781637;
    stim[14] = 40'h305dc59db2;
    stim[15] = 40'h629442f3e9;
    stim[16] = 40'h54d9312608;
    stim[17] = 40'h32721ae99a;
    stim[18] = 40'h2d492c4cc7;
    stim[19] = 40'h7fdd4495f5;
    stim[20] = 40'h0127790147;
    stim[21] = 40'h6ea18eaf2d;
    stim[22] = 40'h7a910a83f3;
    stim[23] = 40'h63fc9c4cc5;
    stim[24] = 40'h3167dc43c3;
    stim[25] = 40'h34de53e39d;
    stim[26] = 40'h08ce935801;
    stim[27] = 40'h5652351042;
    stim[28] = 40'h6cf4fc9e8d;
    stim[29] = 40'h2eeb8724fc;
    stim[30] = 40'h6c5933e39b;
    stim[31] = 40'h7d118ba3ff;
    stim[32] = 40'h50af0d2cbf;
    stim[33] = 40'h3e815c8401;
    stim[34] = 40'h143a431ec5;
    stim[35] = 40'h60943738fb;
    stim[36] = 40'h615afde50e;
    stim[37] = 40'h18b1a8356a;
    stim[38] = 40'h49c3477dda;
    stim[39] = 40'h1e0257f651;
    stim[40] = 40'h01c8b0af60;
    stim[41] = 40'h327f0f72af;
    stim[42] = 40'h7af155778c;
    stim[43] = 40'h18e3011dfd;
    stim[44] = 40'hf9a28aa03e;
    stim[45] = 40'h486ec9e305;
    stim[46] = 40'h7da340cb10;
    stim[47] = 40'h32729672ed;
    stim[48] = 40'h6adde2da0e;
    stim[49] = 40'h76e0df19b4;
    stim[50] = 40'h19db5fb685;
    stim[51] = 40'h040f8c7923;
    stim[52] = 40'h56d924a4b3;
    stim[53] = 40'h5a5147b3a3;
    stim[54] = 40'h73c595852b;
    stim[55] = 40'h4f932ad648;
    stim[56] = 40'h5108aa6be6;
    stim[57] = 40'h6fc7b29ba1;
    stim[58] = 40'h1583051dc4;
    stim[59] = 40'h1180d3ee4e;
    stim[60] = 40'h2ae4aac4a9;
    stim[61] = 40'h0f9ca813e7;
    stim[62] = 40'h79f080e82a;
    stim[63] = 40'h253c23ff88;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 22'h000002;
      expv[1] = 22'h000002;
      expv[2] = 22'h000002;
      expv[3] = 22'h200002;
      expv[4] = 22'h000005;
      expv[5] = 22'h000005;
      expv[6] = 22'h000005;
      expv[7] = 22'h000005;
      expv[8] = 22'h000005;
      expv[9] = 22'h000005;
      expv[10] = 22'h000005;
      expv[11] = 22'h000005;
      expv[12] = 22'h000005;
      expv[13] = 22'h000005;
      expv[14] = 22'h000005;
      expv[15] = 22'h000005;
      expv[16] = 22'h000005;
      expv[17] = 22'h000005;
      expv[18] = 22'h000005;
      expv[19] = 22'h000005;
      expv[20] = 22'h000005;
      expv[21] = 22'h000005;
      expv[22] = 22'h000005;
      expv[23] = 22'h000005;
      expv[24] = 22'h000005;
      expv[25] = 22'h000005;
      expv[26] = 22'h000005;
      expv[27] = 22'h000005;
      expv[28] = 22'h000005;
      expv[29] = 22'h000005;
      expv[30] = 22'h000005;
      expv[31] = 22'h000005;
      expv[32] = 22'h000005;
      expv[33] = 22'h000005;
      expv[34] = 22'h000005;
      expv[35] = 22'h000005;
      expv[36] = 22'h000005;
      expv[37] = 22'h000005;
      expv[38] = 22'h000005;
      expv[39] = 22'h000005;
      expv[40] = 22'h000005;
      expv[41] = 22'h000005;
      expv[42] = 22'h000005;
      expv[43] = 22'h000005;
      expv[44] = 22'h000005;
      expv[45] = 22'h000002;
      expv[46] = 22'h200002;
      expv[47] = 22'h200002;
      expv[48] = 22'h200002;
      expv[49] = 22'h200002;
      expv[50] = 22'h200002;
      expv[51] = 22'h000005;
      expv[52] = 22'h000005;
      expv[53] = 22'h000005;
      expv[54] = 22'h000005;
      expv[55] = 22'h000005;
      expv[56] = 22'h000005;
      expv[57] = 22'h000005;
      expv[58] = 22'h000005;
      expv[59] = 22'h000005;
      expv[60] = 22'h000005;
      expv[61] = 22'h000005;
      expv[62] = 22'h000005;
      expv[63] = 22'h000005;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
