// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_082004 dut (
    .PC(in_vec[34:3]),
    .reset(in_vec[2:2]),
    .stall(in_vec[1:1]),
    .stall_reg(in_vec[0:0]),
    .REIC(out_vec[4:4]),
    .REBIOS(out_vec[3:3]),
    .REISR(out_vec[2:2]),
    .IFSel(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h4c20e70c5;
    stim[1] = 35'h71775bf57;
    stim[2] = 35'h391098622;
    stim[3] = 35'h6e4c6e90a;
    stim[4] = 35'h63146c441;
    stim[5] = 35'h7e221eafb;
    stim[6] = 35'h3dfb6c1e8;
    stim[7] = 35'h25b72cd48;
    stim[8] = 35'h2120991ea;
    stim[9] = 35'h4b066892b;
    stim[10] = 35'h515b843f9;
    stim[11] = 35'h20188a481;
    stim[12] = 35'h5f42744c2;
    stim[13] = 35'h035403c51;
    stim[14] = 35'h251a572f8;
    stim[15] = 35'h766cec721;
    stim[16] = 35'h151010450;
    stim[17] = 35'h591fe0d00;
    stim[18] = 35'h23d1c039a;
    stim[19] = 35'h52f0425f9;
    stim[20] = 35'h1134c4393;
    stim[21] = 35'h31e3eab70;
    stim[22] = 35'h79afaeeb3;
    stim[23] = 35'h39df51703;
    stim[24] = 35'h4774277c9;
    stim[25] = 35'h35b0d3722;
    stim[26] = 35'h03896bab3;
    stim[27] = 35'h553932683;
    stim[28] = 35'h1f21bae71;
    stim[29] = 35'h3f3154588;
    stim[30] = 35'h68d3a5fa0;
    stim[31] = 35'h5391db6b3;
    stim[32] = 35'h69793d482;
    stim[33] = 35'h6e5eeb2d0;
    stim[34] = 35'h0a9f40d28;
    stim[35] = 35'h5c43f52c1;
    stim[36] = 35'h5d0e26d8a;
    stim[37] = 35'h643576b7b;
    stim[38] = 35'h40dc11b51;
    stim[39] = 35'h3aec50aeb;
    stim[40] = 35'h1ca0e211a;
    stim[41] = 35'h0e5855831;
    stim[42] = 35'h4473f8a61;
    stim[43] = 35'h0478fb6fb;
    stim[44] = 35'h13ae1e482;
    stim[45] = 35'h5eec48002;
    stim[46] = 35'h7741c06c8;
    stim[47] = 35'h7461c82a1;
    stim[48] = 35'h76be031e3;
    stim[49] = 35'h38c9d6960;
    stim[50] = 35'h0dd2c4081;
    stim[51] = 35'h7525662a0;
    stim[52] = 35'h3d73c39f9;
    stim[53] = 35'h11c3c8ae9;
    stim[54] = 35'h14dc4b251;
    stim[55] = 35'h2349b2741;
    stim[56] = 35'h2c5e5b622;
    stim[57] = 35'h5691cde30;
    stim[58] = 35'h6e48e2e53;
    stim[59] = 35'h2bd354ab8;
    stim[60] = 35'h6b9098651;
    stim[61] = 35'h7c53b571b;
    stim[62] = 35'h0aa818529;
    stim[63] = 35'h208dfe042;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h06;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h09;
      expv[8] = 5'h01;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h09;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h09;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h01;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h10;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h06;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h10;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h10;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h09;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h10;
      expv[63] = 5'h01;
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
