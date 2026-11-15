// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_128896 dut (
    .clk(clk),
    .rst(in_vec[17:17]),
    .start(in_vec[16:16]),
    .dividend(in_vec[15:8]),
    .divisor(in_vec[7:0]),
    .quotient(out_vec[16:9]),
    .remainder(out_vec[8:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h284ad;
    stim[1] = 18'h26fee;
    stim[2] = 18'h0baa8;
    stim[3] = 18'h06ff6;
    stim[4] = 18'h1ba6c;
    stim[5] = 18'h120b5;
    stim[6] = 18'h14598;
    stim[7] = 18'h0a360;
    stim[8] = 18'h19a48;
    stim[9] = 18'h0bdce;
    stim[10] = 18'h08f2c;
    stim[11] = 18'h0fcda;
    stim[12] = 18'h08933;
    stim[13] = 18'h175db;
    stim[14] = 18'h09324;
    stim[15] = 18'h00586;
    stim[16] = 18'h187c1;
    stim[17] = 18'h00c8a;
    stim[18] = 18'h0776e;
    stim[19] = 18'h1725c;
    stim[20] = 18'h0e78a;
    stim[21] = 18'h10706;
    stim[22] = 18'h04a46;
    stim[23] = 18'h19cbf;
    stim[24] = 18'h15051;
    stim[25] = 18'h07121;
    stim[26] = 18'h0a457;
    stim[27] = 18'h00508;
    stim[28] = 18'h11250;
    stim[29] = 18'h18959;
    stim[30] = 18'h07265;
    stim[31] = 18'h1a431;
    stim[32] = 18'h153ba;
    stim[33] = 18'h1bfce;
    stim[34] = 18'h10dfd;
    stim[35] = 18'h1a96a;
    stim[36] = 18'h04cd8;
    stim[37] = 18'h0826d;
    stim[38] = 18'h183f8;
    stim[39] = 18'h11609;
    stim[40] = 18'h178d9;
    stim[41] = 18'h027c5;
    stim[42] = 18'h10fcd;
    stim[43] = 18'h1dc2a;
    stim[44] = 18'h160ad;
    stim[45] = 18'h19748;
    stim[46] = 18'h09c46;
    stim[47] = 18'h12670;
    stim[48] = 18'h0f845;
    stim[49] = 18'h00430;
    stim[50] = 18'h03083;
    stim[51] = 18'h1abc7;
    stim[52] = 18'h2e89c;
    stim[53] = 18'h010f8;
    stim[54] = 18'h007bc;
    stim[55] = 18'h0c361;
    stim[56] = 18'h01cc0;
    stim[57] = 18'h146d9;
    stim[58] = 18'h06ccf;
    stim[59] = 18'h0fdfd;
    stim[60] = 18'h1968c;
    stim[61] = 18'h1fab0;
    stim[62] = 18'h09bcf;
    stim[63] = 18'h1b7d6;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00174;
      expv[6] = 17'h0000a;
      expv[7] = 17'h00014;
      expv[8] = 17'h0002a;
      expv[9] = 17'h00056;
      expv[10] = 17'h000ae;
      expv[11] = 17'h00056;
      expv[12] = 17'h000ae;
      expv[13] = 17'h08449;
      expv[14] = 17'h084ea;
      expv[15] = 17'h084a2;
      expv[16] = 17'h08546;
      expv[17] = 17'h0848e;
      expv[18] = 17'h0851e;
      expv[19] = 17'h08442;
      expv[20] = 17'h08486;
      expv[21] = 17'h0850c;
      expv[22] = 17'h08901;
      expv[23] = 17'h08901;
      expv[24] = 17'h08938;
      expv[25] = 17'h08896;
      expv[26] = 17'h08854;
      expv[27] = 17'h088a8;
      expv[28] = 17'h08898;
      expv[29] = 17'h08932;
      expv[30] = 17'h08880;
      expv[31] = 17'h08900;
      expv[32] = 17'h0d49f;
      expv[33] = 17'h0d4a6;
      expv[34] = 17'h0d54c;
      expv[35] = 17'h0d49a;
      expv[36] = 17'h0d534;
      expv[37] = 17'h0d46a;
      expv[38] = 17'h0d4d4;
      expv[39] = 17'h0d5a8;
      expv[40] = 17'h0d596;
      expv[41] = 17'h0032f;
      expv[42] = 17'h0032f;
      expv[43] = 17'h0021e;
      expv[44] = 17'h0023c;
      expv[45] = 17'h00278;
      expv[46] = 17'h002f0;
      expv[47] = 17'h00264;
      expv[48] = 17'h002ca;
      expv[49] = 17'h00240;
      expv[50] = 17'h00282;
      expv[51] = 17'h01507;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h0008c;
      expv[59] = 17'h00118;
      expv[60] = 17'h00032;
      expv[61] = 17'h00064;
      expv[62] = 17'h000c8;
      expv[63] = 17'h00190;
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
