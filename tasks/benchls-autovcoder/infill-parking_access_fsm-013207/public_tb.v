// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_013207 dut (
    .clk(clk),
    .reset_n(in_vec[6:6]),
    .sensor_entrance(in_vec[5:5]),
    .sensor_exit(in_vec[4:4]),
    .password(in_vec[3:0]),
    .GREEN_LED(out_vec[8:8]),
    .RED_LED(out_vec[7:7]),
    .countcar(out_vec[6:3]),
    .indicator(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h2c;
    stim[1] = 7'h23;
    stim[2] = 7'h73;
    stim[3] = 7'h43;
    stim[4] = 7'h6c;
    stim[5] = 7'h71;
    stim[6] = 7'h44;
    stim[7] = 7'h42;
    stim[8] = 7'h51;
    stim[9] = 7'h4b;
    stim[10] = 7'h70;
    stim[11] = 7'h78;
    stim[12] = 7'h77;
    stim[13] = 7'h58;
    stim[14] = 7'h71;
    stim[15] = 7'h71;
    stim[16] = 7'h7b;
    stim[17] = 7'h66;
    stim[18] = 7'h40;
    stim[19] = 7'h41;
    stim[20] = 7'h4d;
    stim[21] = 7'h66;
    stim[22] = 7'h66;
    stim[23] = 7'h4b;
    stim[24] = 7'h7e;
    stim[25] = 7'h7c;
    stim[26] = 7'h5d;
    stim[27] = 7'h57;
    stim[28] = 7'h61;
    stim[29] = 7'h41;
    stim[30] = 7'h48;
    stim[31] = 7'h6c;
    stim[32] = 7'h48;
    stim[33] = 7'h43;
    stim[34] = 7'h60;
    stim[35] = 7'h4b;
    stim[36] = 7'h5c;
    stim[37] = 7'h4a;
    stim[38] = 7'h4c;
    stim[39] = 7'h5a;
    stim[40] = 7'h43;
    stim[41] = 7'h4f;
    stim[42] = 7'h77;
    stim[43] = 7'h72;
    stim[44] = 7'h7b;
    stim[45] = 7'h67;
    stim[46] = 7'h46;
    stim[47] = 7'h66;
    stim[48] = 7'h7a;
    stim[49] = 7'h4f;
    stim[50] = 7'h01;
    stim[51] = 7'h48;
    stim[52] = 7'h62;
    stim[53] = 7'h45;
    stim[54] = 7'h6d;
    stim[55] = 7'h4a;
    stim[56] = 7'h64;
    stim[57] = 7'h4c;
    stim[58] = 7'h56;
    stim[59] = 7'h48;
    stim[60] = 7'h6d;
    stim[61] = 7'h63;
    stim[62] = 7'h46;
    stim[63] = 7'h51;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h0xx;
      expv[2] = 9'h0xx;
      expv[3] = 9'h0xx;
      expv[4] = 9'h0xx;
      expv[5] = 9'h0xx;
      expv[6] = 9'h0xx;
      expv[7] = 9'h0xx;
      expv[8] = 9'h0xx;
      expv[9] = 9'h0xx;
      expv[10] = 9'h0xx;
      expv[11] = 9'h0xx;
      expv[12] = 9'h0xx;
      expv[13] = 9'h0xx;
      expv[14] = 9'h0xx;
      expv[15] = 9'h0xx;
      expv[16] = 9'h0xx;
      expv[17] = 9'h0xx;
      expv[18] = 9'h0xx;
      expv[19] = 9'h0xx;
      expv[20] = 9'h0xx;
      expv[21] = 9'h0xx;
      expv[22] = 9'h0xx;
      expv[23] = 9'h0xx;
      expv[24] = 9'h0xx;
      expv[25] = 9'h0xx;
      expv[26] = 9'h0xx;
      expv[27] = 9'h0xx;
      expv[28] = 9'h0xx;
      expv[29] = 9'h0xx;
      expv[30] = 9'h0xx;
      expv[31] = 9'h0xx;
      expv[32] = 9'h0xx;
      expv[33] = 9'h0xx;
      expv[34] = 9'h0xx;
      expv[35] = 9'h0xx;
      expv[36] = 9'h0xx;
      expv[37] = 9'h0xx;
      expv[38] = 9'h0xx;
      expv[39] = 9'h0xx;
      expv[40] = 9'h0xx;
      expv[41] = 9'h0xx;
      expv[42] = 9'h0xx;
      expv[43] = 9'h0xx;
      expv[44] = 9'h0xx;
      expv[45] = 9'h0xx;
      expv[46] = 9'h0xx;
      expv[47] = 9'h0xx;
      expv[48] = 9'h0xx;
      expv[49] = 9'h0xx;
      expv[50] = 9'h0xx;
      expv[51] = 9'h0xx;
      expv[52] = 9'h0xx;
      expv[53] = 9'h0xx;
      expv[54] = 9'h0xx;
      expv[55] = 9'h0xx;
      expv[56] = 9'h0xx;
      expv[57] = 9'h0xx;
      expv[58] = 9'h0xx;
      expv[59] = 9'h0xx;
      expv[60] = 9'h0xx;
      expv[61] = 9'h0xx;
      expv[62] = 9'h0xx;
      expv[63] = 9'h0xx;
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
