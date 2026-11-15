// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  vga_palette_regs dut (
    .clk(clk),
    .attr(in_vec[16:13]),
    .address(in_vec[12:9]),
    .write(in_vec[8:8]),
    .write_data(in_vec[7:0]),
    .index(out_vec[15:8]),
    .read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0325e;
    stim[1] = 17'h00054;
    stim[2] = 17'h00cc5;
    stim[3] = 17'h09873;
    stim[4] = 17'h18682;
    stim[5] = 17'h14264;
    stim[6] = 17'h11431;
    stim[7] = 17'h0ebb6;
    stim[8] = 17'h19b6c;
    stim[9] = 17'h198b5;
    stim[10] = 17'h1fd5d;
    stim[11] = 17'h189eb;
    stim[12] = 17'h193a0;
    stim[13] = 17'h09b70;
    stim[14] = 17'h1fb14;
    stim[15] = 17'h17d00;
    stim[16] = 17'h0326e;
    stim[17] = 17'h00201;
    stim[18] = 17'h1548d;
    stim[19] = 17'h1610c;
    stim[20] = 17'h01b84;
    stim[21] = 17'h045ba;
    stim[22] = 17'h1b6e2;
    stim[23] = 17'h0f42a;
    stim[24] = 17'h123dd;
    stim[25] = 17'h12b04;
    stim[26] = 17'h09303;
    stim[27] = 17'h10b35;
    stim[28] = 17'h1d401;
    stim[29] = 17'h00bc4;
    stim[30] = 17'h02dbf;
    stim[31] = 17'h15945;
    stim[32] = 17'h1a97c;
    stim[33] = 17'h0a08c;
    stim[34] = 17'h0d3b7;
    stim[35] = 17'h0660e;
    stim[36] = 17'h0a359;
    stim[37] = 17'h042b6;
    stim[38] = 17'h0f41c;
    stim[39] = 17'h15026;
    stim[40] = 17'h02903;
    stim[41] = 17'h01d41;
    stim[42] = 17'h18fa7;
    stim[43] = 17'h0225b;
    stim[44] = 17'h160c5;
    stim[45] = 17'h09fc3;
    stim[46] = 17'h01792;
    stim[47] = 17'h1a1a7;
    stim[48] = 17'h0d60d;
    stim[49] = 17'h19578;
    stim[50] = 17'h1a76a;
    stim[51] = 17'h17502;
    stim[52] = 17'h1aa00;
    stim[53] = 17'h04a56;
    stim[54] = 17'h162ec;
    stim[55] = 17'h13d9b;
    stim[56] = 17'h19ffb;
    stim[57] = 17'h19d16;
    stim[58] = 17'h11fac;
    stim[59] = 17'h1498f;
    stim[60] = 17'h1f70d;
    stim[61] = 17'h026cb;
    stim[62] = 17'h00089;
    stim[63] = 17'h0fdf7;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'heb6c;
      expv[15] = 16'hxx70;
      expv[16] = 16'hxx5d;
      expv[17] = 16'hxxa0;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'h0c14;
      expv[22] = 16'hxxxx;
      expv[23] = 16'h84xx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'ha0xx;
      expv[26] = 16'ha0b6;
      expv[27] = 16'heba0;
      expv[28] = 16'hxx04;
      expv[29] = 16'h00xx;
      expv[30] = 16'h0c35;
      expv[31] = 16'hddxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'h84eb;
      expv[34] = 16'hc40c;
      expv[35] = 16'hbf03;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hc4dd;
      expv[38] = 16'hba59;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'h597c;
      expv[42] = 16'h0c00;
      expv[43] = 16'h45xx;
      expv[44] = 16'h5959;
      expv[45] = 16'hxx0c;
      expv[46] = 16'h03xx;
      expv[47] = 16'h0cxx;
      expv[48] = 16'h840c;
      expv[49] = 16'hbf92;
      expv[50] = 16'h45xx;
      expv[51] = 16'h84xx;
      expv[52] = 16'h9278;
      expv[53] = 16'h84c4;
      expv[54] = 16'hbac4;
      expv[55] = 16'h9259;
      expv[56] = 16'hb741;
      expv[57] = 16'h45c3;
      expv[58] = 16'h459b;
      expv[59] = 16'hxxfb;
      expv[60] = 16'h0203;
      expv[61] = 16'hac92;
      expv[62] = 16'h596a;
      expv[63] = 16'ha7a7;
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
