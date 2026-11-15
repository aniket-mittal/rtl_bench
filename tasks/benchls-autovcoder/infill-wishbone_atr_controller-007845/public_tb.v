// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_007845 dut (
    .clk_i(clk),
    .rst_i(in_vec[47:47]),
    .adr_i(in_vec[46:41]),
    .sel_i(in_vec[40:37]),
    .dat_i(in_vec[36:5]),
    .we_i(in_vec[4:4]),
    .stb_i(in_vec[3:3]),
    .cyc_i(in_vec[2:2]),
    .run_rx(in_vec[1:1]),
    .run_tx(in_vec[0:0]),
    .dat_o(out_vec[64:33]),
    .ack_o(out_vec[32:32]),
    .ctrl_lines(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h8d2eb87b2a67;
    stim[1] = 48'hd9ecea842f2c;
    stim[2] = 48'h5cef3d368dd1;
    stim[3] = 48'h5ba958a781be;
    stim[4] = 48'h40a15d63b34f;
    stim[5] = 48'h4efec38a2b50;
    stim[6] = 48'h5428052dd567;
    stim[7] = 48'h188f40dc0c26;
    stim[8] = 48'h00cfa5f1f0b2;
    stim[9] = 48'hea7b196c219f;
    stim[10] = 48'h400f806bd563;
    stim[11] = 48'h04a701571a23;
    stim[12] = 48'h5b6a18060df9;
    stim[13] = 48'h982398d550b4;
    stim[14] = 48'h5772e851f80b;
    stim[15] = 48'h18b5f4c1b4f2;
    stim[16] = 48'h2e29db74c145;
    stim[17] = 48'h4bd93bf3871c;
    stim[18] = 48'h0d34fef062e5;
    stim[19] = 48'h380a436ef881;
    stim[20] = 48'h198be67dafbd;
    stim[21] = 48'h229de0ba1ddc;
    stim[22] = 48'h6ee3412bf5a8;
    stim[23] = 48'h5c5f36ac65fe;
    stim[24] = 48'h44d3fab0a315;
    stim[25] = 48'h06e24d7e7f69;
    stim[26] = 48'h0e0cf16066c2;
    stim[27] = 48'h7c3e7424b622;
    stim[28] = 48'h4237edf44c91;
    stim[29] = 48'hd81e567432dd;
    stim[30] = 48'h12dff84aaf1b;
    stim[31] = 48'h194376207d54;
    stim[32] = 48'h01abf5ab5427;
    stim[33] = 48'h6990aaec7bf5;
    stim[34] = 48'h573c1d61d2a8;
    stim[35] = 48'h615f4b9de00f;
    stim[36] = 48'h4ff5adc9a173;
    stim[37] = 48'h1dab956f825b;
    stim[38] = 48'h609fb4a79142;
    stim[39] = 48'h53e8da0b45b6;
    stim[40] = 48'h4970a9fa15c3;
    stim[41] = 48'h464320c46dc2;
    stim[42] = 48'h1948045be455;
    stim[43] = 48'h71ac55350897;
    stim[44] = 48'h6462b0de393a;
    stim[45] = 48'h765c3a511987;
    stim[46] = 48'h5b9ee46edfc2;
    stim[47] = 48'h3dcd10d396e4;
    stim[48] = 48'h49e847acc406;
    stim[49] = 48'h1a992da86d01;
    stim[50] = 48'h55ed282b5566;
    stim[51] = 48'h29be06a55679;
    stim[52] = 48'h50103a001ba0;
    stim[53] = 48'h629156fca9bf;
    stim[54] = 48'h2aa25327cf47;
    stim[55] = 48'h68a90de5b28a;
    stim[56] = 48'h0d2f04d53d7a;
    stim[57] = 48'h62c66643c010;
    stim[58] = 48'h64701c987f1d;
    stim[59] = 48'ha8825a1d5753;
    stim[60] = 48'h47e1406cffe5;
    stim[61] = 48'h2ad318aae604;
    stim[62] = 48'h6384dbcf33e7;
    stim[63] = 48'h26a434b73e2b;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'hxxxxxxxxxxxxxxxxx;
      expv[2] = 65'hxxxxxxxxxxxxxxxxx;
      expv[3] = 65'hxxxxxxxxxxxxxxxxx;
      expv[4] = 65'hxxxxxxxxxxxxxxxxx;
      expv[5] = 65'hxxxxxxxxxxxxxxxxx;
      expv[6] = 65'hxxxxxxxxxxxxxxxxx;
      expv[7] = 65'hxxxxxxxxxxxxxxxxx;
      expv[8] = 65'hxxxxxxxxxxxxxxxxx;
      expv[9] = 65'hxxxxxxxxxxxxxxxxx;
      expv[10] = 65'hxxxxxxxxxxxxxxxxx;
      expv[11] = 65'hxxxxxxxxxxxxxxxxx;
      expv[12] = 65'hxxxxxxxxxxxxxxxxx;
      expv[13] = 65'h0958xxx1axxxxxxxx;
      expv[14] = 65'hxxxxxxxxxxxxxxxxx;
      expv[15] = 65'hxxxxxxxxxxxxxxxxx;
      expv[16] = 65'hxxxxxxxxxxxxxxxxx;
      expv[17] = 65'hxxxxxxxxxxxxxxxxx;
      expv[18] = 65'hxxxxxxxxxxxxxxxxx;
      expv[19] = 65'hxxxxxxxxxxxxxxxxx;
      expv[20] = 65'hxxxxxxxxxxxxxxxxx;
      expv[21] = 65'hxxxxxxxxxxxxxxxxx;
      expv[22] = 65'hxxxxxxxxxxxxxxxxx;
      expv[23] = 65'hxxxxxc218xxxxxxxx;
      expv[24] = 65'h0958xxx1bxxxxxxxx;
      expv[25] = 65'hxxxxxxxxxxxxxxxxx;
      expv[26] = 65'hxxxxxxxxxxxxxxxxx;
      expv[27] = 65'hxxxxxxxxxxxxxxxxx;
      expv[28] = 65'hxxxxxxxxxxxxxxxxx;
      expv[29] = 65'hxxxxxxxxxxxxxxxxx;
      expv[30] = 65'h0958ac61bxxxxxxxx;
      expv[31] = 65'hxxxxxxxxx5f33xxxx;
      expv[32] = 65'h0be6xxxxxxxxxxxxx;
      expv[33] = 65'hxxxxxxxxx5f33xxxx;
      expv[34] = 65'hxxxxxc218xxxxxxxx;
      expv[35] = 65'hxxxxxxxxxxxxxxxxx;
      expv[36] = 65'hxxxxxxxxx5f33xxxx;
      expv[37] = 65'h193bf3xxx5f33xxxx;
      expv[38] = 65'h0be6xxxxx5f33xxxx;
      expv[39] = 65'hxxxxxxxxxxxxxxxxx;
      expv[40] = 65'hxxxxxxxxxxxxxxxxx;
      expv[41] = 65'h193bf3xxx5f33xxxx;
      expv[42] = 65'hxxxxxxxxxxxxxxxxx;
      expv[43] = 65'h0be6xxxxxxxxxxxxx;
      expv[44] = 65'hxxxxxxxxx5f33xxxx;
      expv[45] = 65'hxxxxxxxxxxxxxxxxx;
      expv[46] = 65'hxxxxxxxxx5f33xxxx;
      expv[47] = 65'h0958ac61axxxxxxxx;
      expv[48] = 65'hxxxxxxxxxxxxxxxxx;
      expv[49] = 65'h193bf3xxxxxxxxxxx;
      expv[50] = 65'h0be6xxxxxxxxxxxxx;
      expv[51] = 65'hxxxxxxxxxxxxxxxxx;
      expv[52] = 65'hxxxxxxxxxxxxxxxxx;
      expv[53] = 65'hxxxxxxxxxxxxxxxxx;
      expv[54] = 65'hxxxxxxxxx5f33xxxx;
      expv[55] = 65'hxxxxxxxxx5f33xxxx;
      expv[56] = 65'hxxxxxc218xxxxxxxx;
      expv[57] = 65'hxxxxxxxxxxxxxxxxx;
      expv[58] = 65'hxxx6xxxxxxxxxxxxx;
      expv[59] = 65'hxxx6xxxxxxxxxxxxx;
      expv[60] = 65'hxxxxxxxxxxxxxxxxx;
      expv[61] = 65'hxxxxxxxxxxxxxxxxx;
      expv[62] = 65'hxxxxxxxxxxxxxxxxx;
      expv[63] = 65'hxxx6f87f05f33xxxx;
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
