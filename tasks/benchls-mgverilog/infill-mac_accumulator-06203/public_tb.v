// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06203 dut (
    .clock(clk),
    .reset(in_vec[33:33]),
    .clear(in_vec[32:32]),
    .enable_in(in_vec[31:31]),
    .addend(in_vec[30:0]),
    .enable_out(out_vec[34:34]),
    .sum(out_vec[33:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h21fcb666e;
    stim[1] = 34'h37a7c497f;
    stim[2] = 34'h10df1376b;
    stim[3] = 34'h0a4ff2fa8;
    stim[4] = 34'h0b71c8426;
    stim[5] = 34'h11b691123;
    stim[6] = 34'h04cfb74e1;
    stim[7] = 34'h0cd57d463;
    stim[8] = 34'h15ecd24ff;
    stim[9] = 34'h1c599a472;
    stim[10] = 34'h1b3da7102;
    stim[11] = 34'h18601f8e2;
    stim[12] = 34'h1ce1b2aa7;
    stim[13] = 34'h13c283d37;
    stim[14] = 34'h03020d801;
    stim[15] = 34'h18035f597;
    stim[16] = 34'h1ec2924a6;
    stim[17] = 34'h0c75ad984;
    stim[18] = 34'h0d386a644;
    stim[19] = 34'h0c2efbaca;
    stim[20] = 34'h18059a908;
    stim[21] = 34'h1aeb85537;
    stim[22] = 34'h31bb262c7;
    stim[23] = 34'h174a60abc;
    stim[24] = 34'h0ea46cea6;
    stim[25] = 34'h01633b9e0;
    stim[26] = 34'h0c881c091;
    stim[27] = 34'h0dbb2b289;
    stim[28] = 34'h1d216c228;
    stim[29] = 34'h1ad47cd09;
    stim[30] = 34'h1c63ae1e6;
    stim[31] = 34'h113476ffd;
    stim[32] = 34'h07c22ef60;
    stim[33] = 34'h0c4f54e03;
    stim[34] = 34'h1a678d6da;
    stim[35] = 34'h189b9b5d6;
    stim[36] = 34'h09a408cb9;
    stim[37] = 34'h1ae75410d;
    stim[38] = 34'h01298d232;
    stim[39] = 34'h115389fe8;
    stim[40] = 34'h1aa965da3;
    stim[41] = 34'h10e5fae44;
    stim[42] = 34'h11adab773;
    stim[43] = 34'h17cd43501;
    stim[44] = 34'h1877e3048;
    stim[45] = 34'h0c7f48e86;
    stim[46] = 34'h003b5f65b;
    stim[47] = 34'h0fff4cd4b;
    stim[48] = 34'h17b2f825d;
    stim[49] = 34'h04f6bf8bb;
    stim[50] = 34'h021d2d449;
    stim[51] = 34'h1885390b1;
    stim[52] = 34'h112185ed8;
    stim[53] = 34'h12d7de00a;
    stim[54] = 34'h029860ed7;
    stim[55] = 34'h0a9a7ecb5;
    stim[56] = 34'h0272c4a58;
    stim[57] = 34'h398e18583;
    stim[58] = 34'h135dae611;
    stim[59] = 34'h0fbad1109;
    stim[60] = 34'h1fd553788;
    stim[61] = 34'h18f8c8c15;
    stim[62] = 34'h085a0596d;
    stim[63] = 34'h15af7eb8d;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h00df1376b;
      expv[4] = 35'h432f06713;
      expv[5] = 35'h46a0ceb39;
      expv[6] = 35'h01b691123;
      expv[7] = 35'h01b691123;
      expv[8] = 35'h7e8c0e586;
      expv[9] = 35'h3decd24ff;
      expv[10] = 35'h7c599a472;
      expv[11] = 35'h433da7102;
      expv[12] = 35'h40601f8e2;
      expv[13] = 35'h7ce1b2aa7;
      expv[14] = 35'h03c283d37;
      expv[15] = 35'h03c283d37;
      expv[16] = 35'h40035f597;
      expv[17] = 35'h7ec2924a6;
      expv[18] = 35'h7b383fe2a;
      expv[19] = 35'h7870aa46e;
      expv[20] = 35'h749fa5f38;
      expv[21] = 35'h40059a908;
      expv[22] = 35'h42eb85537;
      expv[23] = 35'h000000000;
      expv[24] = 35'h3f4a60abc;
      expv[25] = 35'h7deecd962;
      expv[26] = 35'h3deecd962;
      expv[27] = 35'h7a76e99f3;
      expv[28] = 35'h783214c7c;
      expv[29] = 35'h7d216c228;
      expv[30] = 35'h42d47cd09;
      expv[31] = 35'h7c63ae1e6;
      expv[32] = 35'h013476ffd;
      expv[33] = 35'h013476ffd;
      expv[34] = 35'h7d83cbe00;
      expv[35] = 35'h42678d6da;
      expv[36] = 35'h409b9b5d6;
      expv[37] = 35'h423fa428f;
      expv[38] = 35'h42e75410d;
      expv[39] = 35'h02e75410d;
      expv[40] = 35'h015389fe8;
      expv[41] = 35'h42a965da3;
      expv[42] = 35'h00e5fae44;
      expv[43] = 35'h01adab773;
      expv[44] = 35'h3fcd43501;
      expv[45] = 35'h4077e3048;
      expv[46] = 35'h7cf72bece;
      expv[47] = 35'h3cf72bece;
      expv[48] = 35'h7cf678c19;
      expv[49] = 35'h3fb2f825d;
      expv[50] = 35'h3fb2f825d;
      expv[51] = 35'h3fb2f825d;
      expv[52] = 35'h4085390b1;
      expv[53] = 35'h012185ed8;
      expv[54] = 35'h02d7de00a;
      expv[55] = 35'h02d7de00a;
      expv[56] = 35'h45725ccbf;
      expv[57] = 35'h05725ccbf;
      expv[58] = 35'h400000000;
      expv[59] = 35'h035dae611;
      expv[60] = 35'h43187f71a;
      expv[61] = 35'h7fd553788;
      expv[62] = 35'h40f8c8c15;
      expv[63] = 35'h4152ce582;
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
