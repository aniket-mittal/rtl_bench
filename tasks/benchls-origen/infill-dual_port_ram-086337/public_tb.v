// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086337 dut (
    .clk(clk),
    .reset(in_vec[54:54]),
    .we_a(in_vec[53:50]),
    .addr_a(in_vec[49:41]),
    .wdata_a(in_vec[40:9]),
    .addr_b(in_vec[8:0]),
    .rdata_a(out_vec[63:32]),
    .rdata_b(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h77852b608ad0e6;
    stim[1] = 55'h791279e697ef30;
    stim[2] = 55'h0994bbaaf73b62;
    stim[3] = 55'h00247d619559d7;
    stim[4] = 55'h00a80cac81be8f;
    stim[5] = 55'h2f207b6cfd7cbd;
    stim[6] = 55'h394c63fdf41f51;
    stim[7] = 55'h35c6196c43f830;
    stim[8] = 55'h02040b840ee1c0;
    stim[9] = 55'h11690ddfdbda66;
    stim[10] = 55'h0477ee23cb1979;
    stim[11] = 55'h270446cd8d4516;
    stim[12] = 55'h0a9ec7cf07b8e2;
    stim[13] = 55'h1d5848411ebc49;
    stim[14] = 55'h2e4a886af7e904;
    stim[15] = 55'h38e79e0ea13ee8;
    stim[16] = 55'h3dace0f263c903;
    stim[17] = 55'h032b7351c6e739;
    stim[18] = 55'h308d1d75f33d64;
    stim[19] = 55'h33cee52a24d9e6;
    stim[20] = 55'h1e3b6d9b70b3f7;
    stim[21] = 55'h092cf5e6fbb020;
    stim[22] = 55'h39c71d1aa3224c;
    stim[23] = 55'h0fdc133fa6cf58;
    stim[24] = 55'h0bb4a63bf2431c;
    stim[25] = 55'h0b8e5833b992b3;
    stim[26] = 55'h1fed9e903cf1a4;
    stim[27] = 55'h3088fe5880b45a;
    stim[28] = 55'h2ee5e59d5a5b58;
    stim[29] = 55'h0d1503d35ea0bb;
    stim[30] = 55'h3ad8f396de7316;
    stim[31] = 55'h36a185098cdc2c;
    stim[32] = 55'h0150c78aacef0f;
    stim[33] = 55'h0ec4ab6314924e;
    stim[34] = 55'h061866d26008ea;
    stim[35] = 55'h1f1256c6ffa127;
    stim[36] = 55'h1471db9802fcf1;
    stim[37] = 55'h0488fb5a007b10;
    stim[38] = 55'h357275e52f6776;
    stim[39] = 55'h0429493bd2ba7f;
    stim[40] = 55'h0f5090a1da853f;
    stim[41] = 55'h21200e6ee5bb70;
    stim[42] = 55'h2843305431153f;
    stim[43] = 55'h3856d356d9ef45;
    stim[44] = 55'h03cccdb18dfa66;
    stim[45] = 55'h010597308db932;
    stim[46] = 55'h0943910b259aa2;
    stim[47] = 55'h19ff9b4ae106ca;
    stim[48] = 55'h283633a8542e54;
    stim[49] = 55'h08331575406099;
    stim[50] = 55'h1f689ba266b2ff;
    stim[51] = 55'h04cdc8428b3806;
    stim[52] = 55'h1d38c62303d7bf;
    stim[53] = 55'h1ac25a9cd11f14;
    stim[54] = 55'h3b17653f3a27b2;
    stim[55] = 55'h3246385efe4a6b;
    stim[56] = 55'h1b8293fb78dbc6;
    stim[57] = 55'h2105a670bb1750;
    stim[58] = 55'h2e71b28b634a56;
    stim[59] = 55'h36a6567d5c43b3;
    stim[60] = 55'h1f9ba129a950d4;
    stim[61] = 55'h05b5207b2e441a;
    stim[62] = 55'h180031e15d21f4;
    stim[63] = 55'h32d9376478abc3;
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
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'h0cb6xxfcxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'h7f2cxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxx7bxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxa570xx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxc284xx6e;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
