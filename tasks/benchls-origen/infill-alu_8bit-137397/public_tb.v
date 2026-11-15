// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137397 dut (
    .a(in_vec[17:10]),
    .b(in_vec[9:2]),
    .op(in_vec[1:0]),
    .result(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h33ed5;
    stim[1] = 18'h1e5fd;
    stim[2] = 18'h2d321;
    stim[3] = 18'h1c0d6;
    stim[4] = 18'h1e80d;
    stim[5] = 18'h34eff;
    stim[6] = 18'h0f614;
    stim[7] = 18'h218df;
    stim[8] = 18'h183cd;
    stim[9] = 18'h260cf;
    stim[10] = 18'h22dce;
    stim[11] = 18'h0d77d;
    stim[12] = 18'h38c86;
    stim[13] = 18'h028f3;
    stim[14] = 18'h3599d;
    stim[15] = 18'h0b87e;
    stim[16] = 18'h136ae;
    stim[17] = 18'h3dff8;
    stim[18] = 18'h3b5b6;
    stim[19] = 18'h21c98;
    stim[20] = 18'h32732;
    stim[21] = 18'h301b5;
    stim[22] = 18'h10b00;
    stim[23] = 18'h28b33;
    stim[24] = 18'h166f6;
    stim[25] = 18'h299e8;
    stim[26] = 18'h2dc46;
    stim[27] = 18'h1d9f5;
    stim[28] = 18'h234aa;
    stim[29] = 18'h0b42d;
    stim[30] = 18'h2fb4d;
    stim[31] = 18'h33781;
    stim[32] = 18'h29b1b;
    stim[33] = 18'h350ab;
    stim[34] = 18'h06957;
    stim[35] = 18'h0bf31;
    stim[36] = 18'h3b483;
    stim[37] = 18'h03987;
    stim[38] = 18'h33859;
    stim[39] = 18'h343de;
    stim[40] = 18'h33a4c;
    stim[41] = 18'h09e2a;
    stim[42] = 18'h02cba;
    stim[43] = 18'h28d89;
    stim[44] = 18'h2926b;
    stim[45] = 18'h3aa1f;
    stim[46] = 18'h1170d;
    stim[47] = 18'h24ae5;
    stim[48] = 18'h2bd24;
    stim[49] = 18'h0f7f2;
    stim[50] = 18'h20e00;
    stim[51] = 18'h09618;
    stim[52] = 18'h2537b;
    stim[53] = 18'h0d099;
    stim[54] = 18'h155af;
    stim[55] = 18'h0c4aa;
    stim[56] = 18'h3ee86;
    stim[57] = 18'h0e8a3;
    stim[58] = 18'h143f2;
    stim[59] = 18'h11b23;
    stim[60] = 18'h2fa59;
    stim[61] = 18'h282ff;
    stim[62] = 18'h0d202;
    stim[63] = 18'h2ad7f;
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
      expv[0] = 8'h1a;
      expv[1] = 8'hfa;
      expv[2] = 8'hec;
      expv[3] = 8'h30;
      expv[4] = 8'h77;
      expv[5] = 8'h01;
      expv[6] = 8'hc2;
      expv[7] = 8'h02;
      expv[8] = 8'h6d;
      expv[9] = 8'h02;
      expv[10] = 8'h71;
      expv[11] = 8'h56;
      expv[12] = 8'h43;
      expv[13] = 8'h00;
      expv[14] = 8'h6f;
      expv[15] = 8'h92;
      expv[16] = 8'h6f;
      expv[17] = 8'hf5;
      expv[18] = 8'he9;
      expv[19] = 8'had;
      expv[20] = 8'h2c;
      expv[21] = 8'h53;
      expv[22] = 8'h02;
      expv[23] = 8'h00;
      expv[24] = 8'hb5;
      expv[25] = 8'h20;
      expv[26] = 8'h27;
      expv[27] = 8'hf9;
      expv[28] = 8'h22;
      expv[29] = 8'h22;
      expv[30] = 8'heb;
      expv[31] = 8'hed;
      expv[32] = 8'h00;
      expv[33] = 8'h05;
      expv[34] = 8'h00;
      expv[35] = 8'h63;
      expv[36] = 8'h07;
      expv[37] = 8'h00;
      expv[38] = 8'hb8;
      expv[39] = 8'hb0;
      expv[40] = 8'h61;
      expv[41] = 8'h06;
      expv[42] = 8'hfa;
      expv[43] = 8'h41;
      expv[44] = 8'h01;
      expv[45] = 8'h01;
      expv[46] = 8'h82;
      expv[47] = 8'hd9;
      expv[48] = 8'hf8;
      expv[49] = 8'h0c;
      expv[50] = 8'h03;
      expv[51] = 8'hab;
      expv[52] = 8'h00;
      expv[53] = 8'h0e;
      expv[54] = 8'h00;
      expv[55] = 8'h0a;
      expv[56] = 8'hdb;
      expv[57] = 8'h01;
      expv[58] = 8'hc0;
      expv[59] = 8'h00;
      expv[60] = 8'h28;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h01;
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
