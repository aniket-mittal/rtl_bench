// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04544 dut (
    .clk_vga(clk),
    .CurrentX(in_vec[26:17]),
    .CurrentY(in_vec[16:8]),
    .wall(in_vec[7:0]),
    .mapData(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h5b4c604;
    stim[1] = 27'h6a95f10;
    stim[2] = 27'h0cb54a3;
    stim[3] = 27'h193f35d;
    stim[4] = 27'h48d2717;
    stim[5] = 27'h5f34dd5;
    stim[6] = 27'h5348c48;
    stim[7] = 27'h6f08dec;
    stim[8] = 27'h413e2bd;
    stim[9] = 27'h1de958d;
    stim[10] = 27'h7393eb4;
    stim[11] = 27'h4380a72;
    stim[12] = 27'h40e07aa;
    stim[13] = 27'h41b7109;
    stim[14] = 27'h6ae8482;
    stim[15] = 27'h028acf1;
    stim[16] = 27'h415de9b;
    stim[17] = 27'h1b2f72f;
    stim[18] = 27'h21ffab5;
    stim[19] = 27'h667db9b;
    stim[20] = 27'h2b56999;
    stim[21] = 27'h4192128;
    stim[22] = 27'h232ea83;
    stim[23] = 27'h3aeb8f3;
    stim[24] = 27'h348a29b;
    stim[25] = 27'h1b0d953;
    stim[26] = 27'h3d451f1;
    stim[27] = 27'h4b633a7;
    stim[28] = 27'h4ebcc49;
    stim[29] = 27'h2d385f2;
    stim[30] = 27'h7fbcac0;
    stim[31] = 27'h6ba8fe8;
    stim[32] = 27'h07f9242;
    stim[33] = 27'h0d5b224;
    stim[34] = 27'h6d5b9b2;
    stim[35] = 27'h5769fd9;
    stim[36] = 27'h581a27d;
    stim[37] = 27'h1998349;
    stim[38] = 27'h527a2a6;
    stim[39] = 27'h712a439;
    stim[40] = 27'h6193f5b;
    stim[41] = 27'h4730221;
    stim[42] = 27'h1e837e9;
    stim[43] = 27'h068c334;
    stim[44] = 27'h498e808;
    stim[45] = 27'h67cb21d;
    stim[46] = 27'h02728ec;
    stim[47] = 27'h63398a6;
    stim[48] = 27'h36873a5;
    stim[49] = 27'h02d20c0;
    stim[50] = 27'h39cd217;
    stim[51] = 27'h2f73de6;
    stim[52] = 27'h51fca87;
    stim[53] = 27'h52be42d;
    stim[54] = 27'h14908a1;
    stim[55] = 27'h6ac2984;
    stim[56] = 27'h4ba2488;
    stim[57] = 27'h4fb0057;
    stim[58] = 27'h2ec873c;
    stim[59] = 27'h34e332b;
    stim[60] = 27'h3855b00;
    stim[61] = 27'h2e19785;
    stim[62] = 27'h07ef23b;
    stim[63] = 27'h1a3787c;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h04;
      expv[2] = 8'h10;
      expv[3] = 8'hb6;
      expv[4] = 8'h5d;
      expv[5] = 8'hb6;
      expv[6] = 8'hd5;
      expv[7] = 8'h48;
      expv[8] = 8'hec;
      expv[9] = 8'hbd;
      expv[10] = 8'hb6;
      expv[11] = 8'hb4;
      expv[12] = 8'h72;
      expv[13] = 8'haa;
      expv[14] = 8'hb6;
      expv[15] = 8'h82;
      expv[16] = 8'hb6;
      expv[17] = 8'h9b;
      expv[18] = 8'hb6;
      expv[19] = 8'hb6;
      expv[20] = 8'h9b;
      expv[21] = 8'hb6;
      expv[22] = 8'hb6;
      expv[23] = 8'hb6;
      expv[24] = 8'hb6;
      expv[25] = 8'hb6;
      expv[26] = 8'hb6;
      expv[27] = 8'hb6;
      expv[28] = 8'ha7;
      expv[29] = 8'h49;
      expv[30] = 8'hb6;
      expv[31] = 8'hc0;
      expv[32] = 8'he8;
      expv[33] = 8'hb6;
      expv[34] = 8'hb6;
      expv[35] = 8'hb2;
      expv[36] = 8'hd9;
      expv[37] = 8'h7d;
      expv[38] = 8'hb6;
      expv[39] = 8'ha6;
      expv[40] = 8'h39;
      expv[41] = 8'h5b;
      expv[42] = 8'hb6;
      expv[43] = 8'hb6;
      expv[44] = 8'hb6;
      expv[45] = 8'hb6;
      expv[46] = 8'h1d;
      expv[47] = 8'hb6;
      expv[48] = 8'ha6;
      expv[49] = 8'hb6;
      expv[50] = 8'hb6;
      expv[51] = 8'hb6;
      expv[52] = 8'hb6;
      expv[53] = 8'h87;
      expv[54] = 8'h2d;
      expv[55] = 8'hb6;
      expv[56] = 8'h84;
      expv[57] = 8'h88;
      expv[58] = 8'h57;
      expv[59] = 8'hb6;
      expv[60] = 8'hb6;
      expv[61] = 8'hb6;
      expv[62] = 8'hb6;
      expv[63] = 8'hb6;
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
