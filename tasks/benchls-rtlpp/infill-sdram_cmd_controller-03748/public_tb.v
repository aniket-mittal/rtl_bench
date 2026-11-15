// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03748 dut (
    .CLK(clk),
    .RESET_N(in_vec[22:22]),
    .CMD(in_vec[21:19]),
    .ADDR(in_vec[18:3]),
    .REF_ACK(in_vec[2:2]),
    .INIT_ACK(in_vec[1:1]),
    .CM_ACK(in_vec[0:0]),
    .NOP(out_vec[24:24]),
    .READA(out_vec[23:23]),
    .WRITEA(out_vec[22:22]),
    .REFRESH(out_vec[21:21]),
    .PRECHARGE(out_vec[20:20]),
    .LOAD_MODE(out_vec[19:19]),
    .SADDR(out_vec[18:3]),
    .REF_REQ(out_vec[2:2]),
    .INIT_REQ(out_vec[1:1]),
    .CMD_ACK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h24328c;
    stim[1] = 23'h07e179;
    stim[2] = 23'h65ad28;
    stim[3] = 23'h5d5426;
    stim[4] = 23'h697ef4;
    stim[5] = 23'h5ab0ff;
    stim[6] = 23'h559837;
    stim[7] = 23'h6211c6;
    stim[8] = 23'h7583f8;
    stim[9] = 23'h4fd1f1;
    stim[10] = 23'h70afe5;
    stim[11] = 23'h750385;
    stim[12] = 23'h59fdd9;
    stim[13] = 23'h73bc24;
    stim[14] = 23'h575e38;
    stim[15] = 23'h5bc712;
    stim[16] = 23'h437aca;
    stim[17] = 23'h7c280e;
    stim[18] = 23'h433d9c;
    stim[19] = 23'h68afc6;
    stim[20] = 23'h62e978;
    stim[21] = 23'h581ded;
    stim[22] = 23'h4d7d5d;
    stim[23] = 23'h5d34ba;
    stim[24] = 23'h68cdfd;
    stim[25] = 23'h5cc9ba;
    stim[26] = 23'h7940da;
    stim[27] = 23'h4dfdc3;
    stim[28] = 23'h6b5956;
    stim[29] = 23'h513ded;
    stim[30] = 23'h6d451e;
    stim[31] = 23'h4ae4d7;
    stim[32] = 23'h13fee4;
    stim[33] = 23'h4f02d6;
    stim[34] = 23'h5b188a;
    stim[35] = 23'h5b8a57;
    stim[36] = 23'h56a7bc;
    stim[37] = 23'h413311;
    stim[38] = 23'h49acda;
    stim[39] = 23'h579218;
    stim[40] = 23'h5380ad;
    stim[41] = 23'h62e4d2;
    stim[42] = 23'h60b907;
    stim[43] = 23'h56dece;
    stim[44] = 23'h74ee38;
    stim[45] = 23'h6e0748;
    stim[46] = 23'h70ab77;
    stim[47] = 23'h668399;
    stim[48] = 23'h47c967;
    stim[49] = 23'h5c6ba8;
    stim[50] = 23'h7717cf;
    stim[51] = 23'h53a6c7;
    stim[52] = 23'h7817ae;
    stim[53] = 23'h66bff4;
    stim[54] = 23'h59734c;
    stim[55] = 23'h443e12;
    stim[56] = 23'h4118c3;
    stim[57] = 23'h7963f1;
    stim[58] = 23'h4cf2d9;
    stim[59] = 23'h715f31;
    stim[60] = 23'h71c909;
    stim[61] = 23'h7f82e0;
    stim[62] = 23'h6fd1ba;
    stim[63] = 23'h7c5e55;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h005ad2e;
      expv[4] = 25'h0055422;
      expv[5] = 25'h0017ef2;
      expv[6] = 25'h002b0fb;
      expv[7] = 25'h0459832;
      expv[8] = 25'h00211c2;
      expv[9] = 25'h00583fa;
      expv[10] = 25'h087d1f3;
      expv[11] = 25'h000afe2;
      expv[12] = 25'h0050383;
      expv[13] = 25'h001fdda;
      expv[14] = 25'h003bc22;
      expv[15] = 25'h0475e3a;
      expv[16] = 25'h003c712;
      expv[17] = 25'h1037aca;
      expv[18] = 25'h004280a;
      expv[19] = 25'h1033d9a;
      expv[20] = 25'h000afc2;
      expv[21] = 25'h002e97a;
      expv[22] = 25'h0001deb;
      expv[23] = 25'h0857d5a;
      expv[24] = 25'h00534ba;
      expv[25] = 25'h000cdfb;
      expv[26] = 25'h004c9ba;
      expv[27] = 25'h00140da;
      expv[28] = 25'h085fdc3;
      expv[29] = 25'h0035952;
      expv[30] = 25'h0413deb;
      expv[31] = 25'h005451a;
      expv[32] = 25'h0000000;
      expv[33] = 25'h0000000;
      expv[34] = 25'h08702d6;
      expv[35] = 25'h003188a;
      expv[36] = 25'h0038a53;
      expv[37] = 25'h046a7ba;
      expv[38] = 25'h1013313;
      expv[39] = 25'h081acda;
      expv[40] = 25'h047921a;
      expv[41] = 25'h04380ab;
      expv[42] = 25'h002e4d2;
      expv[43] = 25'h000b903;
      expv[44] = 25'h046deca;
      expv[45] = 25'h004ee3a;
      expv[46] = 25'h006074a;
      expv[47] = 25'h000ab73;
      expv[48] = 25'h006839a;
      expv[49] = 25'h107c963;
      expv[50] = 25'h0046baa;
      expv[51] = 25'h00717cb;
      expv[52] = 25'h043a6c2;
      expv[53] = 25'h00017aa;
      expv[54] = 25'h006bff2;
      expv[55] = 25'h001734a;
      expv[56] = 25'h1043e12;
      expv[57] = 25'h10118c3;
      expv[58] = 25'h00163f2;
      expv[59] = 25'h084f2db;
      expv[60] = 25'h0015f32;
      expv[61] = 25'h001c90b;
      expv[62] = 25'h00782e2;
      expv[63] = 25'h007d1ba;
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
