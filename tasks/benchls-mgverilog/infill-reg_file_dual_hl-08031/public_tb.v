// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08031 dut (
    .clk(clk),
    .AddrC(in_vec[27:25]),
    .AddrA(in_vec[24:22]),
    .AddrB(in_vec[21:19]),
    .DIH(in_vec[18:11]),
    .DIL(in_vec[10:3]),
    .CEN(in_vec[2:2]),
    .WEH(in_vec[1:1]),
    .WEL(in_vec[0:0]),
    .DOBH(out_vec[47:40]),
    .DOAL(out_vec[39:32]),
    .DOCL(out_vec[31:24]),
    .DOBL(out_vec[23:16]),
    .DOCH(out_vec[15:8]),
    .DOAH(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h7ec286d;
    stim[1] = 28'he7ccb34;
    stim[2] = 28'h08b8098;
    stim[3] = 28'hb2f7788;
    stim[4] = 28'h8aaec80;
    stim[5] = 28'h497fdfb;
    stim[6] = 28'h87c1ba8;
    stim[7] = 28'h71c6439;
    stim[8] = 28'he0cd019;
    stim[9] = 28'h205845e;
    stim[10] = 28'hb0f902c;
    stim[11] = 28'h93bca9f;
    stim[12] = 28'hdfdd094;
    stim[13] = 28'h0087e64;
    stim[14] = 28'hddfd4c6;
    stim[15] = 28'hb3d0e36;
    stim[16] = 28'h32e1569;
    stim[17] = 28'h19349d4;
    stim[18] = 28'h8130254;
    stim[19] = 28'hc670778;
    stim[20] = 28'h792b1f8;
    stim[21] = 28'hf324209;
    stim[22] = 28'h6316eb5;
    stim[23] = 28'h2853b87;
    stim[24] = 28'h993ee8a;
    stim[25] = 28'h106a06f;
    stim[26] = 28'h9493dd6;
    stim[27] = 28'h7ff89a4;
    stim[28] = 28'h0c147db;
    stim[29] = 28'h22cabbe;
    stim[30] = 28'hc8e177e;
    stim[31] = 28'h9a4d550;
    stim[32] = 28'hb90e2bd;
    stim[33] = 28'h7ac49f9;
    stim[34] = 28'h60dc700;
    stim[35] = 28'ha29103f;
    stim[36] = 28'h7a5b3bb;
    stim[37] = 28'ha9a0aa0;
    stim[38] = 28'h896039c;
    stim[39] = 28'h7dbba6d;
    stim[40] = 28'h69dd88c;
    stim[41] = 28'h015d78e;
    stim[42] = 28'h7a4cf7c;
    stim[43] = 28'h5c496c3;
    stim[44] = 28'h6a11b55;
    stim[45] = 28'h2fbfecd;
    stim[46] = 28'hb634ca0;
    stim[47] = 28'h42dd541;
    stim[48] = 28'h154e9b9;
    stim[49] = 28'hac54842;
    stim[50] = 28'h97a2e3c;
    stim[51] = 28'h9bed77a;
    stim[52] = 28'h46405fa;
    stim[53] = 28'h934ddc5;
    stim[54] = 28'h9279d92;
    stim[55] = 28'h8d93eaf;
    stim[56] = 28'h598ff59;
    stim[57] = 28'hc3662a1;
    stim[58] = 28'hc300ef8;
    stim[59] = 28'h728c763;
    stim[60] = 28'h2ba5427;
    stim[61] = 28'h19ccfde;
    stim[62] = 28'h2c71742;
    stim[63] = 28'h89e6e8c;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxx0d0dxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxxxx;
      expv[6] = 48'hxxxxxx0dxxxx;
      expv[7] = 48'hxxxxxxxxxxxx;
      expv[8] = 48'hxxxx0dxxxxxx;
      expv[9] = 48'hxxxxxxxxxxxx;
      expv[10] = 48'hxxxxxxxxxxxx;
      expv[11] = 48'hxxxxxx0dxxxx;
      expv[12] = 48'hxx0dxx0dxxxx;
      expv[13] = 48'hxxxxxxxxb0b0;
      expv[14] = 48'hxx0dxxxxxxxx;
      expv[15] = 48'hfa53xx0dxx79;
      expv[16] = 48'hxx53xxxxxxa1;
      expv[17] = 48'hxxxxxxxxb0xx;
      expv[18] = 48'hxxxx53xxa1b0;
      expv[19] = 48'ha1xxxx53xxxx;
      expv[20] = 48'hxxxxxxxxxxxx;
      expv[21] = 48'hxx530dxxfaa1;
      expv[22] = 48'hxxxxxxxxxxb0;
      expv[23] = 48'hb0xxxxd6xxxx;
      expv[24] = 48'ha7xx5370a1xx;
      expv[25] = 48'hb053d6d6b0a1;
      expv[26] = 48'hxxxx0dxxd4xx;
      expv[27] = 48'hfa0dxx0dxxfa;
      expv[28] = 48'hb0xxd6d6b0xx;
      expv[29] = 48'h27d6xxxxxxb0;
      expv[30] = 48'hxx70xxxxxxa7;
      expv[31] = 48'hd4xx0d0dd4xx;
      expv[32] = 48'hc2xxxx7027xx;
      expv[33] = 48'h2757xxxxxxxx;
      expv[34] = 48'hxxd6xxxxxx95;
      expv[35] = 48'h27d6xxxx2795;
      expv[36] = 48'hd457xx0dxxxx;
      expv[37] = 48'hxx70xxxx27c2;
      expv[38] = 48'hc2700d70d4c2;
      expv[39] = 48'hxx0dxxxxxxfa;
      expv[40] = 48'hxx70xxxxxxc2;
      expv[41] = 48'hc20707702222;
      expv[42] = 48'hd457xx0dxxxx;
      expv[43] = 48'hba4d7007c2fa;
      expv[44] = 48'hd470xx0dxxc2;
      expv[45] = 48'hfaxxxx4dxxxx;
      expv[46] = 48'hd4xxxx0d2727;
      expv[47] = 48'h27076axxc2ba;
      expv[48] = 48'hc2xx076aba27;
      expv[49] = 48'hbad9xx0727xx;
      expv[50] = 48'hfaxx0d4dd427;
      expv[51] = 48'hfa570d4dd4xx;
      expv[52] = 48'hd4xx6a0dc2xx;
      expv[53] = 48'hxx0d0d57d4d4;
      expv[54] = 48'hd4b8b8b8d4d4;
      expv[55] = 48'hxxd9b8d9d4xx;
      expv[56] = 48'h27576ad5c2xx;
      expv[57] = 48'hxx075757xxba;
      expv[58] = 48'hxx075757xxba;
      expv[59] = 48'h27b8d5xx27d4;
      expv[60] = 48'hfa6axx4dxxc2;
      expv[61] = 48'h275707d5baxx;
      expv[62] = 48'hbad5xx07xx27;
      expv[63] = 48'h2784b8d5d44a;
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
