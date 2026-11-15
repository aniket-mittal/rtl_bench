// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04575 dut (
    .clk(clk),
    .ce(in_vec[23:23]),
    .reset(in_vec[22:22]),
    .Addr(in_vec[21:20]),
    .DIN(in_vec[19:12]),
    .MW(in_vec[11:11]),
    .LenCtr_Clock(in_vec[10:10]),
    .Env_Clock(in_vec[9:9]),
    .Enabled(in_vec[8:8]),
    .LenCtr_In(in_vec[7:0]),
    .Sample(out_vec[4:1]),
    .IsNonZero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hd21aaf;
    stim[1] = 24'hc9e52b;
    stim[2] = 24'h26c770;
    stim[3] = 24'h33c290;
    stim[4] = 24'h971fbc;
    stim[5] = 24'ha62888;
    stim[6] = 24'h2ab316;
    stim[7] = 24'h202e0f;
    stim[8] = 24'h192bad;
    stim[9] = 24'h08efbc;
    stim[10] = 24'h09ce2f;
    stim[11] = 24'hbe3c6b;
    stim[12] = 24'h9b15ba;
    stim[13] = 24'h1ca53c;
    stim[14] = 24'h9688b4;
    stim[15] = 24'h8ce7b4;
    stim[16] = 24'h30d6a8;
    stim[17] = 24'h97218a;
    stim[18] = 24'h3bda8c;
    stim[19] = 24'h07d216;
    stim[20] = 24'h07565c;
    stim[21] = 24'hb1cfb1;
    stim[22] = 24'h0c480a;
    stim[23] = 24'h2610e8;
    stim[24] = 24'h2adc28;
    stim[25] = 24'hae68fb;
    stim[26] = 24'hba5b07;
    stim[27] = 24'ha3337d;
    stim[28] = 24'h264215;
    stim[29] = 24'h0cf274;
    stim[30] = 24'h17bfee;
    stim[31] = 24'h96ac1c;
    stim[32] = 24'h0b9729;
    stim[33] = 24'h009436;
    stim[34] = 24'h0f9373;
    stim[35] = 24'had560f;
    stim[36] = 24'h85ac41;
    stim[37] = 24'h56d570;
    stim[38] = 24'h159b72;
    stim[39] = 24'h340372;
    stim[40] = 24'hb2b621;
    stim[41] = 24'h1165bc;
    stim[42] = 24'h9a583d;
    stim[43] = 24'h2ceada;
    stim[44] = 24'h0bde84;
    stim[45] = 24'h1a0f6e;
    stim[46] = 24'hb226d4;
    stim[47] = 24'h9c0423;
    stim[48] = 24'hf80fb4;
    stim[49] = 24'h8c1b39;
    stim[50] = 24'h896bb4;
    stim[51] = 24'h2116f1;
    stim[52] = 24'ha4cef9;
    stim[53] = 24'ha02220;
    stim[54] = 24'h260375;
    stim[55] = 24'h3e15ce;
    stim[56] = 24'h1c17f3;
    stim[57] = 24'h9b1cf2;
    stim[58] = 24'h8f2b81;
    stim[59] = 24'h110873;
    stim[60] = 24'ha20d4d;
    stim[61] = 24'h008bc4;
    stim[62] = 24'h2078d1;
    stim[63] = 24'hb70c1a;
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
      expv[0] = 5'h0x;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h1d;
      expv[23] = 5'h1d;
      expv[24] = 5'h1d;
      expv[25] = 5'h1d;
      expv[26] = 5'h00;
      expv[27] = 5'h1f;
      expv[28] = 5'h1d;
      expv[29] = 5'h1d;
      expv[30] = 5'h1d;
      expv[31] = 5'h1d;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
