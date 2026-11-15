// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050577 dut (
    .clk(clk),
    .DO(in_vec[7:7]),
    .cmd(in_vec[6:1]),
    .reset(in_vec[0:0]),
    .isNewResponse(out_vec[41:41]),
    .response(out_vec[40:1]),
    .isRPFinish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h77;
    stim[1] = 8'h8d;
    stim[2] = 8'h88;
    stim[3] = 8'hf4;
    stim[4] = 8'hd0;
    stim[5] = 8'hf4;
    stim[6] = 8'h74;
    stim[7] = 8'h48;
    stim[8] = 8'h7c;
    stim[9] = 8'h58;
    stim[10] = 8'h0e;
    stim[11] = 8'h14;
    stim[12] = 8'ha0;
    stim[13] = 8'h4e;
    stim[14] = 8'hd8;
    stim[15] = 8'h0a;
    stim[16] = 8'h54;
    stim[17] = 8'h48;
    stim[18] = 8'hc8;
    stim[19] = 8'hd6;
    stim[20] = 8'h68;
    stim[21] = 8'hd4;
    stim[22] = 8'hb8;
    stim[23] = 8'h98;
    stim[24] = 8'h52;
    stim[25] = 8'h44;
    stim[26] = 8'hc2;
    stim[27] = 8'hba;
    stim[28] = 8'ha4;
    stim[29] = 8'hb0;
    stim[30] = 8'h9c;
    stim[31] = 8'hca;
    stim[32] = 8'h22;
    stim[33] = 8'hb4;
    stim[34] = 8'ha8;
    stim[35] = 8'hea;
    stim[36] = 8'h2c;
    stim[37] = 8'h7e;
    stim[38] = 8'h74;
    stim[39] = 8'ha2;
    stim[40] = 8'hf4;
    stim[41] = 8'ha0;
    stim[42] = 8'h20;
    stim[43] = 8'h1e;
    stim[44] = 8'h00;
    stim[45] = 8'h30;
    stim[46] = 8'h8a;
    stim[47] = 8'h5c;
    stim[48] = 8'ha8;
    stim[49] = 8'h34;
    stim[50] = 8'h32;
    stim[51] = 8'hd0;
    stim[52] = 8'h7a;
    stim[53] = 8'he4;
    stim[54] = 8'h16;
    stim[55] = 8'h1e;
    stim[56] = 8'h0a;
    stim[57] = 8'he6;
    stim[58] = 8'h10;
    stim[59] = 8'h1a;
    stim[60] = 8'h4c;
    stim[61] = 8'h84;
    stim[62] = 8'h74;
    stim[63] = 8'h60;
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
      expv[0] = 42'h1fffffffffe;
      expv[1] = 42'h1fffffffffe;
      expv[2] = 42'h1fffffffffe;
      expv[3] = 42'h1fffffffffe;
      expv[4] = 42'h1fffffffffe;
      expv[5] = 42'h1fffffffffe;
      expv[6] = 42'h1fffffffffe;
      expv[7] = 42'h00000000000;
      expv[8] = 42'h00000000000;
      expv[9] = 42'h00000000000;
      expv[10] = 42'h00000000000;
      expv[11] = 42'h00000000000;
      expv[12] = 42'h00000000000;
      expv[13] = 42'h00000000002;
      expv[14] = 42'h00000000004;
      expv[15] = 42'h0000000000a;
      expv[16] = 42'h00000000014;
      expv[17] = 42'h00000000028;
      expv[18] = 42'h00000000050;
      expv[19] = 42'h000000000a2;
      expv[20] = 42'h00000000146;
      expv[21] = 42'h0000000028c;
      expv[22] = 42'h0000000051a;
      expv[23] = 42'h00000000a36;
      expv[24] = 42'h0000000146e;
      expv[25] = 42'h000000028dc;
      expv[26] = 42'h000000051b8;
      expv[27] = 42'h0000000a372;
      expv[28] = 42'h000000146e6;
      expv[29] = 42'h00000028dce;
      expv[30] = 42'h00000051b9e;
      expv[31] = 42'h000000a373e;
      expv[32] = 42'h00000146e7e;
      expv[33] = 42'h0000028dcfc;
      expv[34] = 42'h0000051b9fa;
      expv[35] = 42'h00000a373f6;
      expv[36] = 42'h0000146e7ee;
      expv[37] = 42'h000028dcfdc;
      expv[38] = 42'h000051b9fb8;
      expv[39] = 42'h0000a373f70;
      expv[40] = 42'h000146e7ee2;
      expv[41] = 42'h00028dcfdc6;
      expv[42] = 42'h00051b9fb8e;
      expv[43] = 42'h000a373f71c;
      expv[44] = 42'h00146e7ee38;
      expv[45] = 42'h0028dcfdc70;
      expv[46] = 42'h0051b9fb8e1;
      expv[47] = 42'h00a373f71c2;
      expv[48] = 42'h20a373f71c0;
      expv[49] = 42'h20a373f71c0;
      expv[50] = 42'h20000000000;
      expv[51] = 42'h20000000000;
      expv[52] = 42'h20000000002;
      expv[53] = 42'h20000000004;
      expv[54] = 42'h2000000000a;
      expv[55] = 42'h20000000014;
      expv[56] = 42'h20000000028;
      expv[57] = 42'h20000000051;
      expv[58] = 42'h200000000a2;
      expv[59] = 42'h200000000a0;
      expv[60] = 42'h20000000000;
      expv[61] = 42'h20000000000;
      expv[62] = 42'h20000000002;
      expv[63] = 42'h20000000004;
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
