// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_200555 dut (
    .write_s(clk),
    .reset(in_vec[16:16]),
    .pico_out(in_vec[15:8]),
    .id_port(in_vec[7:0]),
    .seg(out_vec[103:96]),
    .min(out_vec[95:88]),
    .hora(out_vec[87:80]),
    .dia(out_vec[79:72]),
    .mes(out_vec[71:64]),
    .year(out_vec[63:56]),
    .seg_tim(out_vec[55:48]),
    .min_tim(out_vec[47:40]),
    .hora_tim(out_vec[39:32]),
    .swt(out_vec[31:24]),
    .flecha(out_vec[23:16]),
    .operacion(out_vec[15:8]),
    .agarre(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1a5be;
    stim[1] = 17'h1e56c;
    stim[2] = 17'h0d88c;
    stim[3] = 17'h0b175;
    stim[4] = 17'h045af;
    stim[5] = 17'h00dea;
    stim[6] = 17'h12999;
    stim[7] = 17'h095ad;
    stim[8] = 17'h0c9ea;
    stim[9] = 17'h0e301;
    stim[10] = 17'h0578d;
    stim[11] = 17'h0a538;
    stim[12] = 17'h03685;
    stim[13] = 17'h098a0;
    stim[14] = 17'h05e65;
    stim[15] = 17'h0b5c4;
    stim[16] = 17'h00ad4;
    stim[17] = 17'h0485a;
    stim[18] = 17'h0634a;
    stim[19] = 17'h0a0fb;
    stim[20] = 17'h1dc20;
    stim[21] = 17'h07510;
    stim[22] = 17'h03d8a;
    stim[23] = 17'h0e5ff;
    stim[24] = 17'h0450a;
    stim[25] = 17'h0e332;
    stim[26] = 17'h0cc04;
    stim[27] = 17'h0b271;
    stim[28] = 17'h022c8;
    stim[29] = 17'h0ee89;
    stim[30] = 17'h0a3c6;
    stim[31] = 17'h010d2;
    stim[32] = 17'h03046;
    stim[33] = 17'h0e810;
    stim[34] = 17'h0bea1;
    stim[35] = 17'h02124;
    stim[36] = 17'h09e8e;
    stim[37] = 17'h0ebd6;
    stim[38] = 17'h07b6a;
    stim[39] = 17'h01c96;
    stim[40] = 17'h07649;
    stim[41] = 17'h06274;
    stim[42] = 17'h0be54;
    stim[43] = 17'h09a91;
    stim[44] = 17'h0cbc0;
    stim[45] = 17'h0f479;
    stim[46] = 17'h00bd5;
    stim[47] = 17'h0d034;
    stim[48] = 17'h0ae96;
    stim[49] = 17'h04a8a;
    stim[50] = 17'h0e3dc;
    stim[51] = 17'h033c4;
    stim[52] = 17'h0f33e;
    stim[53] = 17'h09314;
    stim[54] = 17'h0df3f;
    stim[55] = 17'h06541;
    stim[56] = 17'h02871;
    stim[57] = 17'h057f0;
    stim[58] = 17'h0e095;
    stim[59] = 17'h07084;
    stim[60] = 17'h01a2d;
    stim[61] = 17'h0db46;
    stim[62] = 17'h0768e;
    stim[63] = 17'h0f7d0;
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
      expv[0] = 104'h00000000000000000000000000;
      expv[1] = 104'h00000000000000000000000000;
      expv[2] = 104'h00000000000000000000000000;
      expv[3] = 104'h00000000000000000000000000;
      expv[4] = 104'h00000000000000000000000000;
      expv[5] = 104'h00000000000000000000000000;
      expv[6] = 104'h00000000000000000000000000;
      expv[7] = 104'h00000000000000000000000000;
      expv[8] = 104'h00000000000000000000000000;
      expv[9] = 104'h00000000000000000000000000;
      expv[10] = 104'he3000000000000000000000000;
      expv[11] = 104'he3000000000000000000000000;
      expv[12] = 104'he3000000000000000000000000;
      expv[13] = 104'he3000000000000000000000000;
      expv[14] = 104'he3000000000000000000000000;
      expv[15] = 104'he3000000000000000000000000;
      expv[16] = 104'he3000000000000000000000000;
      expv[17] = 104'he3000000000000000000000000;
      expv[18] = 104'he3000000000000000000000000;
      expv[19] = 104'he3000000000000000000000000;
      expv[20] = 104'h00000000000000000000000000;
      expv[21] = 104'h00000000000000000000000000;
      expv[22] = 104'h00000000000000000000000000;
      expv[23] = 104'h00000000000000000000000000;
      expv[24] = 104'h00000000000000000000000000;
      expv[25] = 104'h00000000000000000045000000;
      expv[26] = 104'h00000000000000000045000000;
      expv[27] = 104'h000000cc000000000045000000;
      expv[28] = 104'h000000cc000000000045000000;
      expv[29] = 104'h000000cc000000000045000000;
      expv[30] = 104'h000000cc000000000045000000;
      expv[31] = 104'h000000cc000000000045000000;
      expv[32] = 104'h000000cc000000000045000000;
      expv[33] = 104'h000000cc000000000045000000;
      expv[34] = 104'h000000cc000000000045000000;
      expv[35] = 104'h000000cc000000000045000000;
      expv[36] = 104'h000000cc000000000045000000;
      expv[37] = 104'h000000cc000000000045000000;
      expv[38] = 104'h000000cc000000000045000000;
      expv[39] = 104'h000000cc000000000045000000;
      expv[40] = 104'h000000cc000000000045000000;
      expv[41] = 104'h000000cc000000000045000000;
      expv[42] = 104'h000000cc000000000045000000;
      expv[43] = 104'h000000cc000000000045000000;
      expv[44] = 104'h000000cc000000000045000000;
      expv[45] = 104'h000000cc000000000045000000;
      expv[46] = 104'h000000cc000000000045000000;
      expv[47] = 104'h000000cc000000000045000000;
      expv[48] = 104'h000000cc000000000045000000;
      expv[49] = 104'h000000cc000000000045000000;
      expv[50] = 104'h000000cc000000000045000000;
      expv[51] = 104'h000000cc000000000045000000;
      expv[52] = 104'h000000cc000000000045000000;
      expv[53] = 104'h000000cc000000000045000000;
      expv[54] = 104'h000000cc000000000045000000;
      expv[55] = 104'h000000cc000000000045000000;
      expv[56] = 104'h000000cc000000000045000000;
      expv[57] = 104'h000000cc000000000045000000;
      expv[58] = 104'h000000cc000000000045000000;
      expv[59] = 104'h000000cc000000000045000000;
      expv[60] = 104'h000000cc000000000045000000;
      expv[61] = 104'h000000cc000000000045000000;
      expv[62] = 104'h000000cc000000000045000000;
      expv[63] = 104'h000000cc000000000045000000;
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
