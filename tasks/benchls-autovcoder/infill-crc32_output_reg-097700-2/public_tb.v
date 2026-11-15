// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097700 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .crc_en_in(in_vec[32:32]),
    .crc_in(in_vec[31:0]),
    .crc_en_out(out_vec[32:32]),
    .crc_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h216368c2b;
    stim[1] = 34'h2884a9e02;
    stim[2] = 34'h0829a8cad;
    stim[3] = 34'h0a96a20cb;
    stim[4] = 34'h0f5750d35;
    stim[5] = 34'h0dae9bd26;
    stim[6] = 34'h0dfd6e4da;
    stim[7] = 34'h0eaf71fa6;
    stim[8] = 34'h034ffc7cd;
    stim[9] = 34'h0f8eebf4a;
    stim[10] = 34'h147703ba0;
    stim[11] = 34'h184358437;
    stim[12] = 34'h0df919df9;
    stim[13] = 34'h17877ea9b;
    stim[14] = 34'h068fba286;
    stim[15] = 34'h1dbdc34ab;
    stim[16] = 34'h0f979238f;
    stim[17] = 34'h03929ceb2;
    stim[18] = 34'h0e30b54ea;
    stim[19] = 34'h126a68764;
    stim[20] = 34'h119a32343;
    stim[21] = 34'h290d17161;
    stim[22] = 34'h124828fe6;
    stim[23] = 34'h1c0aa8b4f;
    stim[24] = 34'h0f6d6095c;
    stim[25] = 34'h0e46e5591;
    stim[26] = 34'h0bd9b40e2;
    stim[27] = 34'h13abd1e57;
    stim[28] = 34'h11526cf36;
    stim[29] = 34'h029a1ed88;
    stim[30] = 34'h13fbcc5c4;
    stim[31] = 34'h045546689;
    stim[32] = 34'h03a78b174;
    stim[33] = 34'h04db0d7f5;
    stim[34] = 34'h0c29e8e4d;
    stim[35] = 34'h12b5bfcaa;
    stim[36] = 34'h0bf980cec;
    stim[37] = 34'h0cc44faca;
    stim[38] = 34'h071608c80;
    stim[39] = 34'h19ae8ebd5;
    stim[40] = 34'h3719fc879;
    stim[41] = 34'h05514701a;
    stim[42] = 34'h1679828a5;
    stim[43] = 34'h05ca767e6;
    stim[44] = 34'h1821a44c2;
    stim[45] = 34'h37bf8eadc;
    stim[46] = 34'h1d21eeef5;
    stim[47] = 34'h102cb6248;
    stim[48] = 34'h15c4611d5;
    stim[49] = 34'h03107ee04;
    stim[50] = 34'h05428d95d;
    stim[51] = 34'h117e48c6e;
    stim[52] = 34'h14d8e8bb7;
    stim[53] = 34'h0d698bb5a;
    stim[54] = 34'h020075442;
    stim[55] = 34'h02f6e56d7;
    stim[56] = 34'h0215c35ed;
    stim[57] = 34'h0941c4fd9;
    stim[58] = 34'h0df3ebd36;
    stim[59] = 34'h11b3b9ac5;
    stim[60] = 34'h197b5488a;
    stim[61] = 34'h3f05b792b;
    stim[62] = 34'h1ce55a959;
    stim[63] = 34'h1aff54488;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h0bea6ce4a;
      expv[4] = 33'h06aa9fb2c;
      expv[5] = 33'h050514f53;
      expv[6] = 33'h0a468429b;
      expv[7] = 33'h00494d8a4;
      expv[8] = 33'h0a810079a;
      expv[9] = 33'h0d3001c4c;
      expv[10] = 33'h0e08802ad;
      expv[11] = 33'h11df123fa;
      expv[12] = 33'h1de53de13;
      expv[13] = 33'h004764660;
      expv[14] = 33'h1e111a826;
      expv[15] = 33'h0e920ba9e;
      expv[16] = 33'h124c4d32a;
      expv[17] = 33'h060613b0e;
      expv[18] = 33'h0636b8cb2;
      expv[19] = 33'h0382fd5a8;
      expv[20] = 33'h19b9a1ed9;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h1dbbe0e98;
      expv[24] = 33'h1fcaa2e0d;
      expv[25] = 33'h090946fc5;
      expv[26] = 33'h0d8895576;
      expv[27] = 33'h04226fdb8;
      expv[28] = 33'h1a3428715;
      expv[29] = 33'h1579b0c93;
      expv[30] = 33'h06b7a48ee;
      expv[31] = 33'h103c25cdc;
      expv[32] = 33'h05dd5996e;
      expv[33] = 33'h0a3e172d1;
      expv[34] = 33'h04df21450;
      expv[35] = 33'h0bc868e4d;
      expv[36] = 33'h12b25c0aa;
      expv[37] = 33'h002e6cfc8;
      expv[38] = 33'h0ccdda0ac;
      expv[39] = 33'h071f9cefe;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h055d7f1a7;
      expv[43] = 33'h119e6eb5a;
      expv[44] = 33'h0c51a1998;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h1b4878850;
      expv[48] = 33'h1bf2cb9ed;
      expv[49] = 33'h1c59d7754;
      expv[50] = 33'h0731f88df;
      expv[51] = 33'h0d5eb6445;
      expv[52] = 33'h117d8ce89;
      expv[53] = 33'h14d8e2e12;
      expv[54] = 33'h094e622a5;
      expv[55] = 33'h0fb1fd5bd;
      expv[56] = 33'h00b899514;
      expv[57] = 33'h07bc55348;
      expv[58] = 33'h0d6c70d64;
      expv[59] = 33'h004834293;
      expv[60] = 33'h12723a65c;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h18c556a65;
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
