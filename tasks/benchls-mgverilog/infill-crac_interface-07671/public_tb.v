// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07671 dut (
    .clk(clk),
    .rst(in_vec[54:54]),
    .crac_we(in_vec[53:53]),
    .crac_out(in_vec[52:21]),
    .valid(in_vec[20:20]),
    .in_slt2(in_vec[19:0]),
    .crac_din(out_vec[59:44]),
    .crac_wr_done(out_vec[43:43]),
    .crac_rd_done(out_vec[42:42]),
    .out_slt1(out_vec[41:22]),
    .out_slt2(out_vec[21:2]),
    .crac_valid(out_vec[1:1]),
    .crac_wr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h488c4adef14804;
    stim[1] = 55'h6e614dc38df520;
    stim[2] = 55'h28e9083a1ce63f;
    stim[3] = 55'h10340286fe5847;
    stim[4] = 55'h05b89d05ed19cc;
    stim[5] = 55'h0d7189a2d6f05a;
    stim[6] = 55'h2f4acc9ed5f116;
    stim[7] = 55'h16b7afeaaf1c43;
    stim[8] = 55'h38ac24c6b0c1c6;
    stim[9] = 55'h0ca24d4eb18982;
    stim[10] = 55'h30fa0987d25371;
    stim[11] = 55'h0d023a10b08d9a;
    stim[12] = 55'h333d7a10329966;
    stim[13] = 55'h0a2dbcc2b0c0dc;
    stim[14] = 55'h2396608c9e7740;
    stim[15] = 55'h0b86e31cafd9a2;
    stim[16] = 55'h0dab81e4ee6d55;
    stim[17] = 55'h239c6dbfea9ec5;
    stim[18] = 55'h290b1428b1edf3;
    stim[19] = 55'h2ae12aa7b577cb;
    stim[20] = 55'h39073be4f173a4;
    stim[21] = 55'h0e8269a872ff46;
    stim[22] = 55'h0d19dd1d9ea402;
    stim[23] = 55'h287386e6688bc6;
    stim[24] = 55'h173e56d3be4015;
    stim[25] = 55'h2f86fa48b5d324;
    stim[26] = 55'h2a1930427d893f;
    stim[27] = 55'h1de8529e2ad2d2;
    stim[28] = 55'h0e69d67e01f4fc;
    stim[29] = 55'h3cea3b029edc39;
    stim[30] = 55'h2563cd2b221d8f;
    stim[31] = 55'h308273f6039448;
    stim[32] = 55'h1449dc73ef6325;
    stim[33] = 55'h10a44288a2d160;
    stim[34] = 55'h1292babb6332be;
    stim[35] = 55'h0fff9913e83431;
    stim[36] = 55'h3c95caca729954;
    stim[37] = 55'h04e64fdfa6a20c;
    stim[38] = 55'h1389e63b3d2b78;
    stim[39] = 55'h368d5d4c01e515;
    stim[40] = 55'h350f6fee13b329;
    stim[41] = 55'h1c0eefacf3d648;
    stim[42] = 55'h3b5c2ab4e9d3bc;
    stim[43] = 55'h13a3004c4618c4;
    stim[44] = 55'h2d5272f72406d2;
    stim[45] = 55'h078ed187d76988;
    stim[46] = 55'h0fa62aa0a13067;
    stim[47] = 55'h09b1ff85f9b925;
    stim[48] = 55'h3c02ec840c76cd;
    stim[49] = 55'h3ce981c2d86130;
    stim[50] = 55'h093db05f4c9809;
    stim[51] = 55'h2974422bdb50a6;
    stim[52] = 55'h36e0e32fdc6e37;
    stim[53] = 55'h36863ce4d6ffa0;
    stim[54] = 55'h1d53779e6e99ea;
    stim[55] = 55'h26ccc2323ef903;
    stim[56] = 55'h215917bdab4fa0;
    stim[57] = 55'h38841278e8b685;
    stim[58] = 55'h10845c643818c1;
    stim[59] = 55'h114a581b6ebe3a;
    stim[60] = 55'h062f38176d4b72;
    stim[61] = 55'h0969c10597393c;
    stim[62] = 55'h09740329ac4916;
    stim[63] = 55'h04ce10c6593b97;
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
      expv[0] = 60'h0000x880015bdc0;
      expv[1] = 60'h0000028001b8700;
      expv[2] = 60'h000012000107400;
      expv[3] = 60'h000028000050dc0;
      expv[4] = 60'h0000110003a0bc0;
      expv[5] = 60'h000003000134580;
      expv[6] = 60'h000015800193d80;
      expv[7] = 60'h00002f4001fd540;
      expv[8] = 60'h000038400098d40;
      expv[9] = 60'h0000048001a9d40;
      expv[10] = 60'h000034000130f80;
      expv[11] = 60'h000004400342140;
      expv[12] = 60'h00003ac00342040;
      expv[13] = 60'h00001b400398540;
      expv[14] = 60'h00000cc00011900;
      expv[15] = 60'h00000dc00063940;
      expv[16] = 60'h00001700003c9c0;
      expv[17] = 60'h000018c001b7fc0;
      expv[18] = 60'h000016000285140;
      expv[19] = 60'h000002400154f40;
      expv[20] = 60'h00002e40037c9c0;
      expv[21] = 60'h000004c001350c0;
      expv[22] = 60'h0000138003a3b00;
      expv[23] = 60'h0000070000dccc0;
      expv[24] = 60'h00003c8002da740;
      expv[25] = 60'h00000dc00349140;
      expv[26] = 60'h0000124002084c0;
      expv[27] = 60'h000030800253c40;
      expv[28] = 60'h0000138002cfc00;
      expv[29] = 60'h000034400360500;
      expv[30] = 60'h0000078001a5640;
      expv[31] = 60'h000024c0027ec00;
      expv[32] = 60'h00003380038e7c0;
      expv[33] = 60'h000028800051140;
      expv[34] = 60'h0000254003576c0;
      expv[35] = 60'h00001f0003227c0;
      expv[36] = 60'h00002b8001594c0;
      expv[37] = 60'h00000c8001fbf40;
      expv[38] = 60'h000033c000c7640;
      expv[39] = 60'h00003a8003a9800;
      expv[40] = 60'h00003ec001fdc00;
      expv[41] = 60'h00003dc001f59c0;
      expv[42] = 60'h0000384001569c0;
      expv[43] = 60'h000026000009880;
      expv[44] = 60'h000004c0025ee40;
      expv[45] = 60'h00001d800230f80;
      expv[46] = 60'h00000c400154140;
      expv[47] = 60'h000003c003f0bc0;
      expv[48] = 60'h000025c00190800;
      expv[49] = 60'h000033000038580;
      expv[50] = 60'h00001b40020be80;
      expv[51] = 60'h000008800045780;
      expv[52] = 60'h000021c00065f80;
      expv[53] = 60'h00002c40039c980;
      expv[54] = 60'h000026c002f3cc0;
      expv[55] = 60'h000019800046440;
      expv[56] = 60'h0000120002f7b40;
      expv[57] = 60'h00002800024f1c0;
      expv[58] = 60'h00002880038c840;
      expv[59] = 60'h0000348003036c0;
      expv[60] = 60'h00001e400302ec0;
      expv[61] = 60'h000013800020b00;
      expv[62] = 60'h000008000065340;
      expv[63] = 60'h00001c000218c80;
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
