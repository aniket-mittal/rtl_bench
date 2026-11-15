// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08797 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .target_angle(in_vec[31:0]),
    .x_res(out_vec[63:32]),
    .y_res(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h14aa9b5e1;
    stim[1] = 33'h108cff206;
    stim[2] = 33'h0cb4a7d84;
    stim[3] = 33'h004777043;
    stim[4] = 33'h07b772af8;
    stim[5] = 33'h09b8f41c7;
    stim[6] = 33'h0a5c3076e;
    stim[7] = 33'h0e81b33f7;
    stim[8] = 33'h01e324c37;
    stim[9] = 33'h0e683cdfc;
    stim[10] = 33'h0deeca72c;
    stim[11] = 33'h06fe83d15;
    stim[12] = 33'h055eb4330;
    stim[13] = 33'h061e8a5a9;
    stim[14] = 33'h060af1337;
    stim[15] = 33'h0ffd7b26c;
    stim[16] = 33'h0d55b9190;
    stim[17] = 33'h0997f18f2;
    stim[18] = 33'h0e163cf91;
    stim[19] = 33'h046a64035;
    stim[20] = 33'h00d33519b;
    stim[21] = 33'h0e1fbc82a;
    stim[22] = 33'h05cb64079;
    stim[23] = 33'h04f686fbe;
    stim[24] = 33'h05c182589;
    stim[25] = 33'h0ca7188eb;
    stim[26] = 33'h05b72d178;
    stim[27] = 33'h0bb1d927a;
    stim[28] = 33'h05d1dd67b;
    stim[29] = 33'h063eb1fdf;
    stim[30] = 33'h022586ebf;
    stim[31] = 33'h07bb21e60;
    stim[32] = 33'h0bddbadc7;
    stim[33] = 33'h0eed38337;
    stim[34] = 33'h0174ac594;
    stim[35] = 33'h00cfe8bb9;
    stim[36] = 33'h0f6f5aa15;
    stim[37] = 33'h07be99eef;
    stim[38] = 33'h088a43ab9;
    stim[39] = 33'h00986337a;
    stim[40] = 33'h012c3535f;
    stim[41] = 33'h0123db54d;
    stim[42] = 33'h0755c0a16;
    stim[43] = 33'h0243a18d3;
    stim[44] = 33'h0199bfc8d;
    stim[45] = 33'h0efd04763;
    stim[46] = 33'h028033ffe;
    stim[47] = 33'h05daee24e;
    stim[48] = 33'h015e3bc7a;
    stim[49] = 33'h0bc303a87;
    stim[50] = 33'h0eeae88df;
    stim[51] = 33'h0104f53d5;
    stim[52] = 33'h02f61d6fd;
    stim[53] = 33'h01b0ed4b1;
    stim[54] = 33'h02bc7cb17;
    stim[55] = 33'h05d9625a6;
    stim[56] = 33'h0d77b273d;
    stim[57] = 33'h0df1fe7a6;
    stim[58] = 33'h00064422a;
    stim[59] = 33'h09f6d5082;
    stim[60] = 33'h0870a82ee;
    stim[61] = 33'h03b4220ba;
    stim[62] = 33'h08f1e4b1b;
    stim[63] = 33'h0039bdbb6;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h00019a0700014181;
      expv[2] = 64'h00019a0700014181;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h0000000000000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h0000000000000000;
      expv[50] = 64'h0000000000000000;
      expv[51] = 64'h0000000000000000;
      expv[52] = 64'h0000000000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'h0000000000000000;
      expv[56] = 64'h0000000000000000;
      expv[57] = 64'h0000000000000000;
      expv[58] = 64'h0000000000000000;
      expv[59] = 64'h0000000000000000;
      expv[60] = 64'h0000000000000000;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'h0000000000000000;
      expv[63] = 64'h0000000000000000;
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
