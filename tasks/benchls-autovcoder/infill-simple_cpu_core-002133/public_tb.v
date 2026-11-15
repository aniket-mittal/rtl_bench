// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002133 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h12f1d0b71;
    stim[1] = 33'h11fd7e9e0;
    stim[2] = 33'h05ef9bf70;
    stim[3] = 33'h027958648;
    stim[4] = 33'h06d1d7007;
    stim[5] = 33'h099615dc9;
    stim[6] = 33'h03598d366;
    stim[7] = 33'h07c9e82d5;
    stim[8] = 33'h0f2dd0b3f;
    stim[9] = 33'h0dec82672;
    stim[10] = 33'h099b8123d;
    stim[11] = 33'h060b162bb;
    stim[12] = 33'h02fedf39a;
    stim[13] = 33'h08fe4e870;
    stim[14] = 33'h0edc5e457;
    stim[15] = 33'h0522e775d;
    stim[16] = 33'h0cf416e08;
    stim[17] = 33'h012a7e151;
    stim[18] = 33'h02ec1fd7c;
    stim[19] = 33'h06dedba28;
    stim[20] = 33'h026cdc5e8;
    stim[21] = 33'h0d6d49c3c;
    stim[22] = 33'h098bd5c0c;
    stim[23] = 33'h0fc075e09;
    stim[24] = 33'h0bbf63abe;
    stim[25] = 33'h0c704b4d3;
    stim[26] = 33'h063bcec46;
    stim[27] = 33'h0829422f9;
    stim[28] = 33'h00563aaeb;
    stim[29] = 33'h0e81afcd8;
    stim[30] = 33'h04245fadf;
    stim[31] = 33'h0ace178e6;
    stim[32] = 33'h08a0c2868;
    stim[33] = 33'h00f8abc64;
    stim[34] = 33'h097485046;
    stim[35] = 33'h05c20623f;
    stim[36] = 33'h03c1edc14;
    stim[37] = 33'h02499be3f;
    stim[38] = 33'h0b61144ac;
    stim[39] = 33'h01b7d7562;
    stim[40] = 33'h080219e95;
    stim[41] = 33'h0c3153d18;
    stim[42] = 33'h0b2c61ed4;
    stim[43] = 33'h0c783a5b1;
    stim[44] = 33'h0b42a1cc0;
    stim[45] = 33'h04a94b96a;
    stim[46] = 33'h01c3faf8d;
    stim[47] = 33'h02e178918;
    stim[48] = 33'h0e69177a7;
    stim[49] = 33'h04f6cf46e;
    stim[50] = 33'h0bf3140e4;
    stim[51] = 33'h03cbf5acb;
    stim[52] = 33'h0c9dd2e3c;
    stim[53] = 33'h0d09d43a5;
    stim[54] = 33'h091f8515d;
    stim[55] = 33'h014da846d;
    stim[56] = 33'h0c621fed7;
    stim[57] = 33'h0d37be2f2;
    stim[58] = 33'h0b613d40d;
    stim[59] = 33'h031f7c628;
    stim[60] = 33'h046ce0c62;
    stim[61] = 33'h003999e17;
    stim[62] = 33'h0d128c682;
    stim[63] = 33'h013c25c74;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxe0;
      expv[3] = 74'h00000000xxxxxxxxx70;
      expv[4] = 74'h00000000xxxxxxxxx70;
      expv[5] = 74'h0000000000000000070;
      expv[6] = 74'h0000000000000000070;
      expv[7] = 74'h0000000040000000170;
      expv[8] = 74'h00000000000000000d5;
      expv[9] = 74'h00000000000000000d5;
      expv[10] = 74'h00000000000000000d5;
      expv[11] = 74'h00000000000000000d5;
      expv[12] = 74'h00000000800000001d5;
      expv[13] = 74'h000000000000000009a;
      expv[14] = 74'h000000000000000009a;
      expv[15] = 74'h000000000000000009a;
      expv[16] = 74'h000000000000000009a;
      expv[17] = 74'h00000000c000000019a;
      expv[18] = 74'h0000000000000000051;
      expv[19] = 74'h0000000000000000051;
      expv[20] = 74'h0000000000000000051;
      expv[21] = 74'h0000000000000000051;
      expv[22] = 74'h0000000100000000151;
      expv[23] = 74'h000000000000000000c;
      expv[24] = 74'h000000000000000000c;
      expv[25] = 74'h000000000000000000c;
      expv[26] = 74'h000000000000000000c;
      expv[27] = 74'h000000014000000010c;
      expv[28] = 74'h00000000000000000f9;
      expv[29] = 74'h00000000000000000f9;
      expv[30] = 74'h00000000000000000f9;
      expv[31] = 74'h00000000000000000f9;
      expv[32] = 74'h00000001800000001f9;
      expv[33] = 74'h0000000000000000068;
      expv[34] = 74'h0000000000000000068;
      expv[35] = 74'h0000000000000000068;
      expv[36] = 74'h0000000000000000068;
      expv[37] = 74'h00000001c0000000168;
      expv[38] = 74'h000000000000000003f;
      expv[39] = 74'h000000000000000003f;
      expv[40] = 74'h000000000000000003f;
      expv[41] = 74'h000000000000000003f;
      expv[42] = 74'h000000020000000013f;
      expv[43] = 74'h00000000000000000d4;
      expv[44] = 74'h00000000000000000d4;
      expv[45] = 74'h00000000000000000d4;
      expv[46] = 74'h00000000000000000d4;
      expv[47] = 74'h00000002400000001d4;
      expv[48] = 74'h0000000000000000018;
      expv[49] = 74'h0000000000000000018;
      expv[50] = 74'h0000000000000000018;
      expv[51] = 74'h0000000000000000018;
      expv[52] = 74'h0000000280000000118;
      expv[53] = 74'h000000000000000003c;
      expv[54] = 74'h000000000000000003c;
      expv[55] = 74'h000000000000000003c;
      expv[56] = 74'h000000000000000003c;
      expv[57] = 74'h00000002c000000013c;
      expv[58] = 74'h00000000000000000f2;
      expv[59] = 74'h00000000000000000f2;
      expv[60] = 74'h00000000000000000f2;
      expv[61] = 74'h00000000000000000f2;
      expv[62] = 74'h00000003000000001f2;
      expv[63] = 74'h0000000000000000082;
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
