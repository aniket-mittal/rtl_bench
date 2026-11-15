// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 118;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072758 dut (
    .clk(clk),
    .rst(in_vec[5:5]),
    .press(in_vec[4:4]),
    .scan_code(in_vec[3:0]),
    .buf_flag(out_vec[117:112]),
    .key_buf_code(out_vec[111:88]),
    .key_buf_code_2(out_vec[87:64]),
    .key_buf_code_3(out_vec[63:32]),
    .key_buf_code_4(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h31;
    stim[1] = 6'h2f;
    stim[2] = 6'h0d;
    stim[3] = 6'h0a;
    stim[4] = 6'h12;
    stim[5] = 6'h08;
    stim[6] = 6'h0d;
    stim[7] = 6'h35;
    stim[8] = 6'h0c;
    stim[9] = 6'h0c;
    stim[10] = 6'h1a;
    stim[11] = 6'h04;
    stim[12] = 6'h1c;
    stim[13] = 6'h17;
    stim[14] = 6'h21;
    stim[15] = 6'h0a;
    stim[16] = 6'h1f;
    stim[17] = 6'h0d;
    stim[18] = 6'h0a;
    stim[19] = 6'h0c;
    stim[20] = 6'h04;
    stim[21] = 6'h06;
    stim[22] = 6'h00;
    stim[23] = 6'h12;
    stim[24] = 6'h0a;
    stim[25] = 6'h05;
    stim[26] = 6'h14;
    stim[27] = 6'h0c;
    stim[28] = 6'h34;
    stim[29] = 6'h17;
    stim[30] = 6'h04;
    stim[31] = 6'h1b;
    stim[32] = 6'h0c;
    stim[33] = 6'h1d;
    stim[34] = 6'h09;
    stim[35] = 6'h16;
    stim[36] = 6'h15;
    stim[37] = 6'h1b;
    stim[38] = 6'h06;
    stim[39] = 6'h0e;
    stim[40] = 6'h19;
    stim[41] = 6'h0f;
    stim[42] = 6'h0a;
    stim[43] = 6'h17;
    stim[44] = 6'h05;
    stim[45] = 6'h01;
    stim[46] = 6'h19;
    stim[47] = 6'h1e;
    stim[48] = 6'h09;
    stim[49] = 6'h1a;
    stim[50] = 6'h1b;
    stim[51] = 6'h10;
    stim[52] = 6'h11;
    stim[53] = 6'h02;
    stim[54] = 6'h05;
    stim[55] = 6'h19;
    stim[56] = 6'h09;
    stim[57] = 6'h10;
    stim[58] = 6'h1d;
    stim[59] = 6'h0a;
    stim[60] = 6'h0a;
    stim[61] = 6'h0b;
    stim[62] = 6'h1b;
    stim[63] = 6'h18;
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
      expv[0] = 118'h000000000000000000000000000000;
      expv[1] = 118'h000000000000000000000000000000;
      expv[2] = 118'h000000000000000000000000000000;
      expv[3] = 118'h000000000000000000000000000000;
      expv[4] = 118'h000000000000000000000000000000;
      expv[5] = 118'h010000020000000000000200000002;
      expv[6] = 118'h010000020000000000000200000002;
      expv[7] = 118'h000000000000000000000000000000;
      expv[8] = 118'h000000000000000000000000000000;
      expv[9] = 118'h000000000000000000000000000000;
      expv[10] = 118'h000000000000000000000000000000;
      expv[11] = 118'h0100000a0000000000000a0000000a;
      expv[12] = 118'h0100000a0000000000000a0000000a;
      expv[13] = 118'h030000ac000000000000ac000000ac;
      expv[14] = 118'h000000000000000000000000000000;
      expv[15] = 118'h000000000000000000000000000000;
      expv[16] = 118'h000000000000000000000000000000;
      expv[17] = 118'h0100000f0000000000000f00000000;
      expv[18] = 118'h0100000f0000000000000f00000000;
      expv[19] = 118'h0100000f0000000000000f00000000;
      expv[20] = 118'h0100000f0000000000000f00000000;
      expv[21] = 118'h0100000f0000000000000f00000000;
      expv[22] = 118'h0100000f0000000000000f00000000;
      expv[23] = 118'h0100000f0000000000000f00000000;
      expv[24] = 118'h030000f2000000000000f200000002;
      expv[25] = 118'h030000f2000000000000f200000002;
      expv[26] = 118'h030000f2000000000000f200000002;
      expv[27] = 118'h07000f2400000000000f2400000024;
      expv[28] = 118'h000000000000000000000000000000;
      expv[29] = 118'h000000000000000000000000000000;
      expv[30] = 118'h010000070000070000000700000007;
      expv[31] = 118'h010000070000070000000700000007;
      expv[32] = 118'h0300007b0000070000007b0000007b;
      expv[33] = 118'h0300007b0000070000007b0000007b;
      expv[34] = 118'h070007bd000007000007bd000007bd;
      expv[35] = 118'h070007bd000007000007bd000007bd;
      expv[36] = 118'h0f007bd600000700007bd600007bd6;
      expv[37] = 118'h1f07bd650000750007bd650007bd65;
      expv[38] = 118'h3f7bd65b000075007bd65b007bd65b;
      expv[39] = 118'h3f7bd65b000075007bd65b007bd65b;
      expv[40] = 118'h3f7bd65b000075007bd65b007bd65b;
      expv[41] = 118'h3fbd65b900075907bd65b907bd65b9;
      expv[42] = 118'h3fbd65b900075907bd65b907bd65b9;
      expv[43] = 118'h3fbd65b900075907bd65b907bd65b9;
      expv[44] = 118'h3fd65b970075977bd65b977bd65b97;
      expv[45] = 118'h3fd65b970075977bd65b977bd65b97;
      expv[46] = 118'h3fd65b970075977bd65b977bd65b97;
      expv[47] = 118'h3f65b979075979bd65b979bd65b979;
      expv[48] = 118'h3f5b979e075979d65b979ed65b979e;
      expv[49] = 118'h3f5b979e075979d65b979ed65b979e;
      expv[50] = 118'h3fb979ea07597965b979ea65b979ea;
      expv[51] = 118'h3f979eab0759795b979eab5b979eab;
      expv[52] = 118'h3f79eab0075979b979eab0b979eab0;
      expv[53] = 118'h3f9eab01759791979eab01979eab01;
      expv[54] = 118'h3f9eab01759791979eab01979eab01;
      expv[55] = 118'h3f9eab01759791979eab01979eab01;
      expv[56] = 118'h3feab01959791979eab01979eab019;
      expv[57] = 118'h3feab01959791979eab01979eab019;
      expv[58] = 118'h3fab01905979199eab01909eab0190;
      expv[59] = 118'h3fb0190d597919eab0190deab0190d;
      expv[60] = 118'h3fb0190d597919eab0190deab0190d;
      expv[61] = 118'h3fb0190d597919eab0190deab0190d;
      expv[62] = 118'h3fb0190d597919eab0190deab0190d;
      expv[63] = 118'h3f0190db597919ab0190dbab0190db;
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
