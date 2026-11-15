// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08973 dut (
    .clk(clk),
    .branch(in_vec[32:32]),
    .baddr(in_vec[31:0]),
    .pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h05942fab8;
    stim[1] = 33'h12385a555;
    stim[2] = 33'h049bb2a1d;
    stim[3] = 33'h1fe76999d;
    stim[4] = 33'h0c9b9e467;
    stim[5] = 33'h1f7dc0717;
    stim[6] = 33'h1c4bcd407;
    stim[7] = 33'h1ec93c108;
    stim[8] = 33'h088b679cc;
    stim[9] = 33'h0def41065;
    stim[10] = 33'h0d801830a;
    stim[11] = 33'h050297cc3;
    stim[12] = 33'h11dda49b3;
    stim[13] = 33'h03a48e310;
    stim[14] = 33'h10c835f53;
    stim[15] = 33'h1c8071fa0;
    stim[16] = 33'h1ec08ca0e;
    stim[17] = 33'h03c6a31cc;
    stim[18] = 33'h0d99b4b3d;
    stim[19] = 33'h023299fb1;
    stim[20] = 33'h0ae2d8d71;
    stim[21] = 33'h0877f4112;
    stim[22] = 33'h150bdc0cf;
    stim[23] = 33'h0f358c1df;
    stim[24] = 33'h004f2017a;
    stim[25] = 33'h18849ceb7;
    stim[26] = 33'h10369867c;
    stim[27] = 33'h10f11d080;
    stim[28] = 33'h0939593e7;
    stim[29] = 33'h116d864dc;
    stim[30] = 33'h0330c324e;
    stim[31] = 33'h099260822;
    stim[32] = 33'h13f5bbf55;
    stim[33] = 33'h1d91cadc1;
    stim[34] = 33'h036e5c48f;
    stim[35] = 33'h0706dd0e3;
    stim[36] = 33'h05b718ef3;
    stim[37] = 33'h060876de4;
    stim[38] = 33'h132be395b;
    stim[39] = 33'h1481e9238;
    stim[40] = 33'h04368f0e1;
    stim[41] = 33'h0ba3496af;
    stim[42] = 33'h1cba19d4c;
    stim[43] = 33'h14dd6cf8c;
    stim[44] = 33'h17e88116f;
    stim[45] = 33'h0db7687c6;
    stim[46] = 33'h161a1dcd3;
    stim[47] = 33'h03d67a618;
    stim[48] = 33'h0046c208d;
    stim[49] = 33'h04d4a3383;
    stim[50] = 33'h0c3ae3ea8;
    stim[51] = 33'h0f657fa0e;
    stim[52] = 33'h008f62ad7;
    stim[53] = 33'h03f38da45;
    stim[54] = 33'h0aac3c041;
    stim[55] = 33'h17a805024;
    stim[56] = 33'h065805bcd;
    stim[57] = 33'h102ba9878;
    stim[58] = 33'h1a548a3ae;
    stim[59] = 33'h1a2d40b22;
    stim[60] = 33'h0b8685384;
    stim[61] = 33'h0c11c36e0;
    stim[62] = 33'h03b1159a2;
    stim[63] = 33'h16093b794;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000004;
      expv[2] = 32'h00000008;
      expv[3] = 32'h2385a555;
      expv[4] = 32'h2385a559;
      expv[5] = 32'hfe7699a1;
      expv[6] = 32'hfe7699a5;
      expv[7] = 32'h1b61ac6c;
      expv[8] = 32'he8427960;
      expv[9] = 32'heb0a5aa9;
      expv[10] = 32'heb0a5aad;
      expv[11] = 32'heb0a5ab1;
      expv[12] = 32'heb0a5ab5;
      expv[13] = 32'heb0a5ab9;
      expv[14] = 32'h08e4a460;
      expv[15] = 32'h08e4a464;
      expv[16] = 32'hf78dba08;
      expv[17] = 32'hb3117a59;
      expv[18] = 32'hf4ed6e6e;
      expv[19] = 32'hf4ed6e72;
      expv[20] = 32'hf4ed6e76;
      expv[21] = 32'hf4ed6e7a;
      expv[22] = 32'hf4ed6e7e;
      expv[23] = 32'hf4ed6e82;
      expv[24] = 32'h45ab2f45;
      expv[25] = 32'h45ab2f49;
      expv[26] = 32'h45ab2f4d;
      expv[27] = 32'h7d373d39;
      expv[28] = 32'h4914b5c1;
      expv[29] = 32'h54bcffc9;
      expv[30] = 32'h54bcffcd;
      expv[31] = 32'h940fa215;
      expv[32] = 32'h940fa219;
      expv[33] = 32'h940fa21d;
      expv[34] = 32'h9418bf22;
      expv[35] = 32'h6d2c4fd6;
      expv[36] = 32'h6d2c4fda;
      expv[37] = 32'h6d2c4fde;
      expv[38] = 32'h6d2c4fe2;
      expv[39] = 32'h6d2c4fe6;
      expv[40] = 32'h9fea8935;
      expv[41] = 32'hb54ae216;
      expv[42] = 32'hb54ae21a;
      expv[43] = 32'hb54ae21e;
      expv[44] = 32'h6b8c2681;
      expv[45] = 32'h0321b1a2;
      expv[46] = 32'h33d2f389;
      expv[47] = 32'h33d2f38d;
      expv[48] = 32'hcd2e0354;
      expv[49] = 32'hcd2e0358;
      expv[50] = 32'hcd2e035c;
      expv[51] = 32'hcd2e0360;
      expv[52] = 32'hcd2e0364;
      expv[53] = 32'hcd2e0368;
      expv[54] = 32'hcd2e036c;
      expv[55] = 32'hcd2e0370;
      expv[56] = 32'hcd2e0374;
      expv[57] = 32'h47ae538c;
      expv[58] = 32'h47ae5390;
      expv[59] = 32'hcfe89be8;
      expv[60] = 32'h7276a722;
      expv[61] = 32'hea825eae;
      expv[62] = 32'hea825eb2;
      expv[63] = 32'hea825eb6;
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
