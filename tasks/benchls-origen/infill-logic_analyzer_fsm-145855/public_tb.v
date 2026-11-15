// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145855 dut (
    .clk(clk),
    .reset(in_vec[28:28]),
    .run(in_vec[27:27]),
    .wrSize(in_vec[26:19]),
    .config_data(in_vec[18:11]),
    .validIn(in_vec[10:10]),
    .dataIn(in_vec[9:2]),
    .busy(in_vec[1:1]),
    .arm(in_vec[0:0]),
    .send(out_vec[11:11]),
    .memoryWrData(out_vec[10:3]),
    .memoryRead(out_vec[2:2]),
    .memoryWrite(out_vec[1:1]),
    .memoryLastWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1d260718;
    stim[1] = 29'h13870104;
    stim[2] = 29'h03716dd1;
    stim[3] = 29'h0060c677;
    stim[4] = 29'h01259c6e;
    stim[5] = 29'h08a67969;
    stim[6] = 29'h09d7b43b;
    stim[7] = 29'h0b771cf8;
    stim[8] = 29'h0de56070;
    stim[9] = 29'h010b870d;
    stim[10] = 29'h0f3e8aac;
    stim[11] = 29'h0ee77202;
    stim[12] = 29'h0feae02d;
    stim[13] = 29'h0d5d6fc0;
    stim[14] = 29'h063ce041;
    stim[15] = 29'h023762c1;
    stim[16] = 29'h0fbbdb2f;
    stim[17] = 29'h0df0603f;
    stim[18] = 29'h0ec254a6;
    stim[19] = 29'h00c1c70e;
    stim[20] = 29'h0b07f87e;
    stim[21] = 29'h022b86bf;
    stim[22] = 29'h0d06364e;
    stim[23] = 29'h0c30a613;
    stim[24] = 29'h0ad159c6;
    stim[25] = 29'h0f574a93;
    stim[26] = 29'h02914a2b;
    stim[27] = 29'h12e3bc9c;
    stim[28] = 29'h02290a40;
    stim[29] = 29'h06b8607f;
    stim[30] = 29'h0478e456;
    stim[31] = 29'h02009771;
    stim[32] = 29'h096daab2;
    stim[33] = 29'h0f123c70;
    stim[34] = 29'h02d39e89;
    stim[35] = 29'h006630d8;
    stim[36] = 29'h06c1557d;
    stim[37] = 29'h030cddac;
    stim[38] = 29'h07d9d6a4;
    stim[39] = 29'h0a6a7f20;
    stim[40] = 29'h03b18919;
    stim[41] = 29'h0192c4bc;
    stim[42] = 29'h08019d01;
    stim[43] = 29'h0477d79f;
    stim[44] = 29'h0a980fe5;
    stim[45] = 29'h0ee8137a;
    stim[46] = 29'h07eab7a8;
    stim[47] = 29'h059c58f4;
    stim[48] = 29'h00910a3c;
    stim[49] = 29'h01792c91;
    stim[50] = 29'h07794bc1;
    stim[51] = 29'h02efb704;
    stim[52] = 29'h0dabf965;
    stim[53] = 29'h0b3a84df;
    stim[54] = 29'h082e8ef7;
    stim[55] = 29'h020c2ee2;
    stim[56] = 29'h0b91a9e2;
    stim[57] = 29'h001f1e94;
    stim[58] = 29'h0070d0e8;
    stim[59] = 29'h0ba64d78;
    stim[60] = 29'h0a36bd29;
    stim[61] = 29'h005fde50;
    stim[62] = 29'h06de773c;
    stim[63] = 29'h04af5495;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h4ea;
      expv[4] = 12'h0da;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h804;
      expv[8] = 12'h000;
      expv[9] = 12'h804;
      expv[10] = 12'h000;
      expv[11] = 12'h804;
      expv[12] = 12'h000;
      expv[13] = 12'h804;
      expv[14] = 12'h000;
      expv[15] = 12'h804;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h804;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h49a;
      expv[23] = 12'h000;
      expv[24] = 12'h804;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h0aa;
      expv[31] = 12'h6e2;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h804;
      expv[35] = 12'h000;
      expv[36] = 12'h804;
      expv[37] = 12'h000;
      expv[38] = 12'h804;
      expv[39] = 12'h000;
      expv[40] = 12'h804;
      expv[41] = 12'h000;
      expv[42] = 12'h804;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h804;
      expv[47] = 12'h000;
      expv[48] = 12'h804;
      expv[49] = 12'h000;
      expv[50] = 12'h804;
      expv[51] = 12'h000;
      expv[52] = 12'h804;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h804;
      expv[57] = 12'h000;
      expv[58] = 12'h804;
      expv[59] = 12'h000;
      expv[60] = 12'h804;
      expv[61] = 12'h000;
      expv[62] = 12'h804;
      expv[63] = 12'h000;
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
