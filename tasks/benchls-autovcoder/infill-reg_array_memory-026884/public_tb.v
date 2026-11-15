// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026884 dut (
    .i_clk(clk),
    .i_rst_n(in_vec[39:39]),
    .i_wen(in_vec[38:38]),
    .i_addr(in_vec[37:32]),
    .i_wdata(in_vec[31:0]),
    .o_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h3328933fec;
    stim[1] = 40'h218ac5024c;
    stim[2] = 40'hda93a5f71c;
    stim[3] = 40'hbacaedb2dd;
    stim[4] = 40'hf51fd322ca;
    stim[5] = 40'hb528f31d92;
    stim[6] = 40'haf6b2c1641;
    stim[7] = 40'hb406e1c0b4;
    stim[8] = 40'had75a215ea;
    stim[9] = 40'hdce920d866;
    stim[10] = 40'hd2007dc2e9;
    stim[11] = 40'hd860296982;
    stim[12] = 40'hd126b16afa;
    stim[13] = 40'ha7d99a8cfc;
    stim[14] = 40'h8ffb75c2c6;
    stim[15] = 40'he9950ad4b4;
    stim[16] = 40'hba736f14dc;
    stim[17] = 40'ha0bdac253f;
    stim[18] = 40'h51d0d83e99;
    stim[19] = 40'hee5f4d7426;
    stim[20] = 40'h8bd69b659b;
    stim[21] = 40'hd59bb1af5f;
    stim[22] = 40'h9f28aff573;
    stim[23] = 40'hb475778080;
    stim[24] = 40'hf4e890f997;
    stim[25] = 40'hd0283d673c;
    stim[26] = 40'h81d6eb0120;
    stim[27] = 40'ha97464586f;
    stim[28] = 40'hd364bd1589;
    stim[29] = 40'h9e0f42ba76;
    stim[30] = 40'hf22b050a6a;
    stim[31] = 40'he8022035c4;
    stim[32] = 40'he784080497;
    stim[33] = 40'hd220ec4b42;
    stim[34] = 40'h869ef26a22;
    stim[35] = 40'h8fd60b8538;
    stim[36] = 40'h8dff82d6ea;
    stim[37] = 40'h4679a23a2d;
    stim[38] = 40'hd0abaaf205;
    stim[39] = 40'hb083952b53;
    stim[40] = 40'h95b5ef4d48;
    stim[41] = 40'he39bbc16cc;
    stim[42] = 40'hc086b41f13;
    stim[43] = 40'h967eddd8d4;
    stim[44] = 40'hd691fb0906;
    stim[45] = 40'hd8d8e26d92;
    stim[46] = 40'hd98a864bd1;
    stim[47] = 40'h8d7c863ca0;
    stim[48] = 40'hc5e07ea689;
    stim[49] = 40'hef2c02583d;
    stim[50] = 40'hccb58c0f96;
    stim[51] = 40'hd4aa6c539a;
    stim[52] = 40'haf7515f044;
    stim[53] = 40'ha612383d67;
    stim[54] = 40'hb5511a7c0b;
    stim[55] = 40'hba3aa2ab3f;
    stim[56] = 40'h9d10175328;
    stim[57] = 40'h998e25e35a;
    stim[58] = 40'hba632f475d;
    stim[59] = 40'hc11b3d818a;
    stim[60] = 40'h80db3a5fd5;
    stim[61] = 40'hc98c5c67ee;
    stim[62] = 40'h918bbd72eb;
    stim[63] = 40'ha8eeaf83fe;
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
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h1fd322ca;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h2c02583d;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h8a864bd1;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h86b41f13;
      expv[62] = 32'h86b41f13;
      expv[63] = 32'h00000000;
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
