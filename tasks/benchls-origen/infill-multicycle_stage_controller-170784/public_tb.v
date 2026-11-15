// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_170784 dut (
    .clk(clk),
    .resetn(in_vec[4:4]),
    .mem_inst(in_vec[3:3]),
    .send_inst(in_vec[2:2]),
    .UART_TE(in_vec[1:1]),
    .mem_force(in_vec[0:0]),
    .EXSTtoMEM_Wen(out_vec[6:6]),
    .IR_Wen(out_vec[5:5]),
    .PC_Wen(out_vec[4:4]),
    .PSR_Wen(out_vec[3:3]),
    .RF_Wen(out_vec[2:2]),
    .ST_Wen(out_vec[1:1]),
    .UART_load(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0e;
    stim[1] = 5'h0a;
    stim[2] = 5'h12;
    stim[3] = 5'h18;
    stim[4] = 5'h1b;
    stim[5] = 5'h19;
    stim[6] = 5'h10;
    stim[7] = 5'h14;
    stim[8] = 5'h1f;
    stim[9] = 5'h12;
    stim[10] = 5'h10;
    stim[11] = 5'h12;
    stim[12] = 5'h13;
    stim[13] = 5'h12;
    stim[14] = 5'h1d;
    stim[15] = 5'h10;
    stim[16] = 5'h11;
    stim[17] = 5'h13;
    stim[18] = 5'h16;
    stim[19] = 5'h02;
    stim[20] = 5'h16;
    stim[21] = 5'h18;
    stim[22] = 5'h17;
    stim[23] = 5'h1a;
    stim[24] = 5'h0c;
    stim[25] = 5'h13;
    stim[26] = 5'h16;
    stim[27] = 5'h10;
    stim[28] = 5'h1e;
    stim[29] = 5'h1d;
    stim[30] = 5'h14;
    stim[31] = 5'h13;
    stim[32] = 5'h13;
    stim[33] = 5'h1d;
    stim[34] = 5'h10;
    stim[35] = 5'h12;
    stim[36] = 5'h14;
    stim[37] = 5'h14;
    stim[38] = 5'h08;
    stim[39] = 5'h12;
    stim[40] = 5'h12;
    stim[41] = 5'h14;
    stim[42] = 5'h1c;
    stim[43] = 5'h1b;
    stim[44] = 5'h13;
    stim[45] = 5'h11;
    stim[46] = 5'h1d;
    stim[47] = 5'h1a;
    stim[48] = 5'h17;
    stim[49] = 5'h12;
    stim[50] = 5'h1d;
    stim[51] = 5'h1a;
    stim[52] = 5'h18;
    stim[53] = 5'h17;
    stim[54] = 5'h13;
    stim[55] = 5'h12;
    stim[56] = 5'h11;
    stim[57] = 5'h1e;
    stim[58] = 5'h18;
    stim[59] = 5'h1f;
    stim[60] = 5'h1a;
    stim[61] = 5'h1a;
    stim[62] = 5'h16;
    stim[63] = 5'h1d;
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
      expv[0] = 7'h20;
      expv[1] = 7'h20;
      expv[2] = 7'h20;
      expv[3] = 7'h5c;
      expv[4] = 7'h00;
      expv[5] = 7'h5c;
      expv[6] = 7'h06;
      expv[7] = 7'h20;
      expv[8] = 7'h41;
      expv[9] = 7'h06;
      expv[10] = 7'h20;
      expv[11] = 7'h1c;
      expv[12] = 7'h20;
      expv[13] = 7'h1c;
      expv[14] = 7'h20;
      expv[15] = 7'h1c;
      expv[16] = 7'h20;
      expv[17] = 7'h1c;
      expv[18] = 7'h20;
      expv[19] = 7'h20;
      expv[20] = 7'h20;
      expv[21] = 7'h5c;
      expv[22] = 7'h00;
      expv[23] = 7'h5c;
      expv[24] = 7'h20;
      expv[25] = 7'h20;
      expv[26] = 7'h01;
      expv[27] = 7'h00;
      expv[28] = 7'h10;
      expv[29] = 7'h20;
      expv[30] = 7'h01;
      expv[31] = 7'h10;
      expv[32] = 7'h20;
      expv[33] = 7'h41;
      expv[34] = 7'h06;
      expv[35] = 7'h20;
      expv[36] = 7'h01;
      expv[37] = 7'h00;
      expv[38] = 7'h20;
      expv[39] = 7'h20;
      expv[40] = 7'h1c;
      expv[41] = 7'h20;
      expv[42] = 7'h41;
      expv[43] = 7'h00;
      expv[44] = 7'h1c;
      expv[45] = 7'h20;
      expv[46] = 7'h41;
      expv[47] = 7'h06;
      expv[48] = 7'h20;
      expv[49] = 7'h1c;
      expv[50] = 7'h20;
      expv[51] = 7'h5c;
      expv[52] = 7'h06;
      expv[53] = 7'h20;
      expv[54] = 7'h1c;
      expv[55] = 7'h20;
      expv[56] = 7'h1c;
      expv[57] = 7'h20;
      expv[58] = 7'h5c;
      expv[59] = 7'h00;
      expv[60] = 7'h5c;
      expv[61] = 7'h06;
      expv[62] = 7'h20;
      expv[63] = 7'h41;
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
