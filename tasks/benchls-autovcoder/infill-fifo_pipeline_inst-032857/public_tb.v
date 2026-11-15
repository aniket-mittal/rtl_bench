// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032857 dut (
    .toplevel_io_axiClk(clk),
    .io_push_valid(in_vec[36:36]),
    .io_push_payload_error(in_vec[35:35]),
    .io_push_payload_inst(in_vec[34:3]),
    .io_pop_ready(in_vec[2:2]),
    .io_flush(in_vec[1:1]),
    .toplevel_resetCtrl_axiReset(in_vec[0:0]),
    .io_push_ready(out_vec[35:35]),
    .io_pop_valid(out_vec[34:34]),
    .io_pop_payload_error(out_vec[33:33]),
    .io_pop_payload_inst(out_vec[32:1]),
    .io_occupancy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1260a12275;
    stim[1] = 37'h172fa2bc85;
    stim[2] = 37'h110ebdd96a;
    stim[3] = 37'h0872262c64;
    stim[4] = 37'h003e144e8e;
    stim[5] = 37'h0174f8701c;
    stim[6] = 37'h1d315277e2;
    stim[7] = 37'h0c70b42450;
    stim[8] = 37'h1e0b6b85f0;
    stim[9] = 37'h0b2fcd9652;
    stim[10] = 37'h042bb93a7e;
    stim[11] = 37'h1d9217c8e8;
    stim[12] = 37'h16fb3114e6;
    stim[13] = 37'h070975ddde;
    stim[14] = 37'h18628777ea;
    stim[15] = 37'h05bb347fd4;
    stim[16] = 37'h0317b8d002;
    stim[17] = 37'h19349a6ad8;
    stim[18] = 37'h020f7985e2;
    stim[19] = 37'h1053828548;
    stim[20] = 37'h1881dfe82c;
    stim[21] = 37'h10df6a411c;
    stim[22] = 37'h1a7583fe1a;
    stim[23] = 37'h07585a94ce;
    stim[24] = 37'h054007f5a4;
    stim[25] = 37'h1e6b9657aa;
    stim[26] = 37'h0a016b82e6;
    stim[27] = 37'h1c7524d27c;
    stim[28] = 37'h0f62f19e24;
    stim[29] = 37'h165dfb2422;
    stim[30] = 37'h07187df2da;
    stim[31] = 37'h12a7f1465c;
    stim[32] = 37'h1639c1555c;
    stim[33] = 37'h0dded44f08;
    stim[34] = 37'h002bac8e2c;
    stim[35] = 37'h1a0829a22c;
    stim[36] = 37'h1996784016;
    stim[37] = 37'h04a4b3b0f0;
    stim[38] = 37'h0000e1ba1c;
    stim[39] = 37'h05923c650a;
    stim[40] = 37'h0aaf5a7a32;
    stim[41] = 37'h0bc56cbf6e;
    stim[42] = 37'h1c3f9e48f6;
    stim[43] = 37'h0ed9ec8916;
    stim[44] = 37'h16fa7c03c8;
    stim[45] = 37'h0450484b20;
    stim[46] = 37'h10d949e9f0;
    stim[47] = 37'h166046f968;
    stim[48] = 37'h0e8146420e;
    stim[49] = 37'h04d0506dd6;
    stim[50] = 37'h0d46e72194;
    stim[51] = 37'h107a03cabc;
    stim[52] = 37'h10e05dcca8;
    stim[53] = 37'h197c3d23e6;
    stim[54] = 37'h0902ef3df4;
    stim[55] = 37'h15cdcb1518;
    stim[56] = 37'h184427c2a2;
    stim[57] = 37'h1cb36e0abc;
    stim[58] = 37'h191d1f4426;
    stim[59] = 37'h016f6361ce;
    stim[60] = 37'h199808259c;
    stim[61] = 37'h18a2cc79f2;
    stim[62] = 37'h1d57ecdc48;
    stim[63] = 37'h034913e38e;
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
      expv[0] = 36'hc9828489c;
      expv[1] = 36'hdcbe8af20;
      expv[2] = 36'hc43af765a;
      expv[3] = 36'ha1c898b18;
      expv[4] = 36'h80f8513a2;
      expv[5] = 36'h85d3e1c06;
      expv[6] = 36'hf4c549df8;
      expv[7] = 36'hb1c2d0914;
      expv[8] = 36'hf82dae17c;
      expv[9] = 36'h782dae17d;
      expv[10] = 36'h90aee4e9e;
      expv[11] = 36'hf6485f23a;
      expv[12] = 36'h76485f23b;
      expv[13] = 36'h9c25d7776;
      expv[14] = 36'he18a1ddfa;
      expv[15] = 36'h96ecd1ff4;
      expv[16] = 36'h8c5ee3400;
      expv[17] = 36'he4d269ab6;
      expv[18] = 36'h64d269ab7;
      expv[19] = 36'hc14e0a152;
      expv[20] = 36'h414e0a153;
      expv[21] = 36'hc37da9046;
      expv[22] = 36'he9d60ff86;
      expv[23] = 36'h9d616a532;
      expv[24] = 36'h95001fd68;
      expv[25] = 36'hf9ae595ea;
      expv[26] = 36'ha805ae0b8;
      expv[27] = 36'hf1d49349e;
      expv[28] = 36'hbd8bc6788;
      expv[29] = 36'hd977ec908;
      expv[30] = 36'h9c61f7cb6;
      expv[31] = 36'hca9fc5196;
      expv[32] = 36'hd8e705556;
      expv[33] = 36'hb77b513c2;
      expv[34] = 36'h80aeb238a;
      expv[35] = 36'he820a688a;
      expv[36] = 36'he659e1004;
      expv[37] = 36'h9292cec3c;
      expv[38] = 36'h800386e86;
      expv[39] = 36'h9648f1942;
      expv[40] = 36'haabd69e8c;
      expv[41] = 36'haf15b2fda;
      expv[42] = 36'hf0fe7923c;
      expv[43] = 36'hbb67b2244;
      expv[44] = 36'hdbe9f00f2;
      expv[45] = 36'h5be9f00f3;
      expv[46] = 36'h5be9f00f3;
      expv[47] = 36'h5be9f00f3;
      expv[48] = 36'h5be9f00f3;
      expv[49] = 36'h934141b74;
      expv[50] = 36'hb51b9c864;
      expv[51] = 36'hc1e80f2ae;
      expv[52] = 36'hc3817732a;
      expv[53] = 36'h43817732b;
      expv[54] = 36'ha40bbcf7c;
      expv[55] = 36'hd7372c546;
      expv[56] = 36'h57372c547;
      expv[57] = 36'hf2cdb82ae;
      expv[58] = 36'he4747d108;
      expv[59] = 36'h85bd8d872;
      expv[60] = 36'he66020966;
      expv[61] = 36'he28b31e7c;
      expv[62] = 36'hf55fb3712;
      expv[63] = 36'h755fb3713;
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
