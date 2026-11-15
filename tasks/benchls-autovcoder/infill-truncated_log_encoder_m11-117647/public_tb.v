// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117647 dut (
    .o(in_vec[31:16]),
    .x(in_vec[15:0]),
    .tlog(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h33f42fda;
    stim[1] = 32'h55c73e88;
    stim[2] = 32'h0e700317;
    stim[3] = 32'h97f2d6a4;
    stim[4] = 32'h15ad1ff6;
    stim[5] = 32'hbca9aef9;
    stim[6] = 32'hb4fa4a62;
    stim[7] = 32'h1a51348a;
    stim[8] = 32'hb7778442;
    stim[9] = 32'h2ee8db16;
    stim[10] = 32'h821365d4;
    stim[11] = 32'hbac7c8dd;
    stim[12] = 32'h7582133a;
    stim[13] = 32'h03a0cd15;
    stim[14] = 32'h3a516f0e;
    stim[15] = 32'h18f48a49;
    stim[16] = 32'h1820a820;
    stim[17] = 32'h4293f03d;
    stim[18] = 32'h4ec18b45;
    stim[19] = 32'hf24816ee;
    stim[20] = 32'hff516c96;
    stim[21] = 32'hfa7e157a;
    stim[22] = 32'h7509ab57;
    stim[23] = 32'hdbfaf69e;
    stim[24] = 32'h41d5a904;
    stim[25] = 32'h253fc668;
    stim[26] = 32'hcceb6cb8;
    stim[27] = 32'hb23926f2;
    stim[28] = 32'h87e6795d;
    stim[29] = 32'h9071f32d;
    stim[30] = 32'hb5cb7b46;
    stim[31] = 32'h5a466b2c;
    stim[32] = 32'h50f7a7b2;
    stim[33] = 32'ha9b89aab;
    stim[34] = 32'h48150ef2;
    stim[35] = 32'h763d68ac;
    stim[36] = 32'h0ac8ad57;
    stim[37] = 32'h9ca0ee1b;
    stim[38] = 32'h23ef9ad1;
    stim[39] = 32'hd99bc06b;
    stim[40] = 32'he661b380;
    stim[41] = 32'h6fb0a04b;
    stim[42] = 32'hf7f7282f;
    stim[43] = 32'h3ccfecc2;
    stim[44] = 32'ha12bc389;
    stim[45] = 32'h12e93b23;
    stim[46] = 32'h2049e569;
    stim[47] = 32'hceafc014;
    stim[48] = 32'hd307f819;
    stim[49] = 32'h3e93ce27;
    stim[50] = 32'h23f1974e;
    stim[51] = 32'hc2c82c3a;
    stim[52] = 32'hf30ea8f6;
    stim[53] = 32'he99d3ec1;
    stim[54] = 32'hef54fc2d;
    stim[55] = 32'h81a5c1a6;
    stim[56] = 32'ha68a58bc;
    stim[57] = 32'h9929650e;
    stim[58] = 32'h4b099b01;
    stim[59] = 32'h01dbed63;
    stim[60] = 32'h5967e7b0;
    stim[61] = 32'hb70e435d;
    stim[62] = 32'h914ce0b6;
    stim[63] = 32'h988e2701;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
