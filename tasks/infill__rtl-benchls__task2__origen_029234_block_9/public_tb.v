// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029234 dut (
    .ALUOp(in_vec[7:6]),
    .Funct(in_vec[5:0]),
    .ALUOperation(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hd2;
    stim[1] = 8'he3;
    stim[2] = 8'h99;
    stim[3] = 8'h90;
    stim[4] = 8'ha0;
    stim[5] = 8'h60;
    stim[6] = 8'h6e;
    stim[7] = 8'h7d;
    stim[8] = 8'h63;
    stim[9] = 8'h8d;
    stim[10] = 8'h28;
    stim[11] = 8'hee;
    stim[12] = 8'hb8;
    stim[13] = 8'h8f;
    stim[14] = 8'h57;
    stim[15] = 8'h2e;
    stim[16] = 8'hdf;
    stim[17] = 8'hf3;
    stim[18] = 8'h0c;
    stim[19] = 8'h28;
    stim[20] = 8'h7c;
    stim[21] = 8'hf8;
    stim[22] = 8'h04;
    stim[23] = 8'hb6;
    stim[24] = 8'h77;
    stim[25] = 8'hd9;
    stim[26] = 8'h64;
    stim[27] = 8'h8f;
    stim[28] = 8'hb7;
    stim[29] = 8'h93;
    stim[30] = 8'h58;
    stim[31] = 8'h20;
    stim[32] = 8'h17;
    stim[33] = 8'hd8;
    stim[34] = 8'hf8;
    stim[35] = 8'hf5;
    stim[36] = 8'had;
    stim[37] = 8'h5b;
    stim[38] = 8'hde;
    stim[39] = 8'haf;
    stim[40] = 8'h12;
    stim[41] = 8'h33;
    stim[42] = 8'he1;
    stim[43] = 8'hd9;
    stim[44] = 8'h59;
    stim[45] = 8'hf0;
    stim[46] = 8'haf;
    stim[47] = 8'h98;
    stim[48] = 8'h0f;
    stim[49] = 8'h73;
    stim[50] = 8'h0a;
    stim[51] = 8'h2c;
    stim[52] = 8'h1c;
    stim[53] = 8'ha0;
    stim[54] = 8'ha3;
    stim[55] = 8'h9b;
    stim[56] = 8'h67;
    stim[57] = 8'h6e;
    stim[58] = 8'h3e;
    stim[59] = 8'hea;
    stim[60] = 8'h3a;
    stim[61] = 8'h55;
    stim[62] = 8'hb5;
    stim[63] = 8'hab;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'ha;
      expv[4] = 4'h2;
      expv[5] = 4'h6;
      expv[6] = 4'h6;
      expv[7] = 4'h6;
      expv[8] = 4'h6;
      expv[9] = 4'hx;
      expv[10] = 4'h2;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'h6;
      expv[15] = 4'h2;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'h2;
      expv[19] = 4'h2;
      expv[20] = 4'h6;
      expv[21] = 4'hx;
      expv[22] = 4'h2;
      expv[23] = 4'hx;
      expv[24] = 4'h6;
      expv[25] = 4'hx;
      expv[26] = 4'h6;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'hx;
      expv[30] = 4'h6;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'hx;
      expv[34] = 4'hx;
      expv[35] = 4'hx;
      expv[36] = 4'hx;
      expv[37] = 4'h6;
      expv[38] = 4'hx;
      expv[39] = 4'hx;
      expv[40] = 4'h2;
      expv[41] = 4'h2;
      expv[42] = 4'hx;
      expv[43] = 4'hx;
      expv[44] = 4'h6;
      expv[45] = 4'hx;
      expv[46] = 4'hx;
      expv[47] = 4'hx;
      expv[48] = 4'h2;
      expv[49] = 4'h6;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'h2;
      expv[54] = 4'hx;
      expv[55] = 4'hx;
      expv[56] = 4'h6;
      expv[57] = 4'h6;
      expv[58] = 4'h2;
      expv[59] = 4'hx;
      expv[60] = 4'h2;
      expv[61] = 4'h6;
      expv[62] = 4'hx;
      expv[63] = 4'hx;
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
