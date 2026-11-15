// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09061 dut (
    .CLK(clk),
    .RESET(in_vec[11:11]),
    .D(in_vec[10:3]),
    .EN(in_vec[2:2]),
    .LOAD(in_vec[1:1]),
    .DOWN(in_vec[0:0]),
    .Q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h956;
    stim[1] = 12'ha3e;
    stim[2] = 12'h552;
    stim[3] = 12'h5d7;
    stim[4] = 12'h7b7;
    stim[5] = 12'h714;
    stim[6] = 12'h20e;
    stim[7] = 12'h709;
    stim[8] = 12'h340;
    stim[9] = 12'h664;
    stim[10] = 12'h713;
    stim[11] = 12'h2ec;
    stim[12] = 12'h16a;
    stim[13] = 12'h295;
    stim[14] = 12'h4e0;
    stim[15] = 12'h6a0;
    stim[16] = 12'h20b;
    stim[17] = 12'h295;
    stim[18] = 12'h42e;
    stim[19] = 12'h3a4;
    stim[20] = 12'h68d;
    stim[21] = 12'h2c9;
    stim[22] = 12'h17f;
    stim[23] = 12'h0d9;
    stim[24] = 12'h4cb;
    stim[25] = 12'h08d;
    stim[26] = 12'h16e;
    stim[27] = 12'h669;
    stim[28] = 12'h2ce;
    stim[29] = 12'h16d;
    stim[30] = 12'h781;
    stim[31] = 12'h070;
    stim[32] = 12'h167;
    stim[33] = 12'h77f;
    stim[34] = 12'h62a;
    stim[35] = 12'h57e;
    stim[36] = 12'h74f;
    stim[37] = 12'h036;
    stim[38] = 12'h00d;
    stim[39] = 12'h27c;
    stim[40] = 12'h689;
    stim[41] = 12'h221;
    stim[42] = 12'h57a;
    stim[43] = 12'h6a2;
    stim[44] = 12'h538;
    stim[45] = 12'h146;
    stim[46] = 12'h5cd;
    stim[47] = 12'h143;
    stim[48] = 12'h6a7;
    stim[49] = 12'h069;
    stim[50] = 12'h656;
    stim[51] = 12'h3ef;
    stim[52] = 12'h50a;
    stim[53] = 12'ha34;
    stim[54] = 12'h60d;
    stim[55] = 12'h23c;
    stim[56] = 12'h46e;
    stim[57] = 12'h23c;
    stim[58] = 12'h543;
    stim[59] = 12'h473;
    stim[60] = 12'h777;
    stim[61] = 12'h686;
    stim[62] = 12'h52c;
    stim[63] = 12'h445;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'hba;
      expv[5] = 8'hf6;
      expv[6] = 8'hf7;
      expv[7] = 8'h41;
      expv[8] = 8'h41;
      expv[9] = 8'h41;
      expv[10] = 8'h42;
      expv[11] = 8'h42;
      expv[12] = 8'h43;
      expv[13] = 8'h43;
      expv[14] = 8'h42;
      expv[15] = 8'h42;
      expv[16] = 8'h42;
      expv[17] = 8'h42;
      expv[18] = 8'h41;
      expv[19] = 8'h85;
      expv[20] = 8'h86;
      expv[21] = 8'h85;
      expv[22] = 8'h85;
      expv[23] = 8'h2f;
      expv[24] = 8'h2f;
      expv[25] = 8'h2f;
      expv[26] = 8'h2e;
      expv[27] = 8'h2d;
      expv[28] = 8'h2d;
      expv[29] = 8'h59;
      expv[30] = 8'h58;
      expv[31] = 8'h58;
      expv[32] = 8'h58;
      expv[33] = 8'h2c;
      expv[34] = 8'hef;
      expv[35] = 8'hef;
      expv[36] = 8'haf;
      expv[37] = 8'he9;
      expv[38] = 8'h06;
      expv[39] = 8'h05;
      expv[40] = 8'h06;
      expv[41] = 8'h06;
      expv[42] = 8'h06;
      expv[43] = 8'h06;
      expv[44] = 8'h06;
      expv[45] = 8'h06;
      expv[46] = 8'h28;
      expv[47] = 8'h27;
      expv[48] = 8'h27;
      expv[49] = 8'hd4;
      expv[50] = 8'hd4;
      expv[51] = 8'hca;
      expv[52] = 8'h7d;
      expv[53] = 8'h7d;
      expv[54] = 8'h00;
      expv[55] = 8'hff;
      expv[56] = 8'h00;
      expv[57] = 8'h8d;
      expv[58] = 8'h8e;
      expv[59] = 8'h8e;
      expv[60] = 8'h8e;
      expv[61] = 8'hee;
      expv[62] = 8'hd0;
      expv[63] = 8'hd1;
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
