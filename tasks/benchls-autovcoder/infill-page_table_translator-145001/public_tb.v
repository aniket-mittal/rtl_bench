// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145001 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .virtual_addr(in_vec[31:0]),
    .physical_addr(out_vec[32:1]),
    .page_fault(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1d6506eec;
    stim[1] = 33'h124c9a66f;
    stim[2] = 33'h04827e36e;
    stim[3] = 33'h05e4de53b;
    stim[4] = 33'h01020a0a9;
    stim[5] = 33'h07814a201;
    stim[6] = 33'h0f4efb2ed;
    stim[7] = 33'h0be3cfdb4;
    stim[8] = 33'h0fcc2f6ce;
    stim[9] = 33'h076a77816;
    stim[10] = 33'h075e7548e;
    stim[11] = 33'h059227142;
    stim[12] = 33'h05ce1fb69;
    stim[13] = 33'h0aa6034db;
    stim[14] = 33'h0efd8c19d;
    stim[15] = 33'h083ef796c;
    stim[16] = 33'h047eb3804;
    stim[17] = 33'h03ab7b010;
    stim[18] = 33'h0eac4f7e1;
    stim[19] = 33'h0f4a60d74;
    stim[20] = 33'h045d2d95b;
    stim[21] = 33'h06170349b;
    stim[22] = 33'h02480afd5;
    stim[23] = 33'h0342bda76;
    stim[24] = 33'h03ced6fa4;
    stim[25] = 33'h075ed8b6a;
    stim[26] = 33'h181368150;
    stim[27] = 33'h09455fcb3;
    stim[28] = 33'h015531470;
    stim[29] = 33'h06c9f77d7;
    stim[30] = 33'h06cb2c6fe;
    stim[31] = 33'h0c572f10b;
    stim[32] = 33'h037320467;
    stim[33] = 33'h0fba9123f;
    stim[34] = 33'h051e84d3e;
    stim[35] = 33'h0577e33be;
    stim[36] = 33'h0e68d89c9;
    stim[37] = 33'h09496bc96;
    stim[38] = 33'h0a6b175fb;
    stim[39] = 33'h08cea4151;
    stim[40] = 33'h0781d6772;
    stim[41] = 33'h0ef38e1b8;
    stim[42] = 33'h0da32f745;
    stim[43] = 33'h087827b13;
    stim[44] = 33'h028303aee;
    stim[45] = 33'h023b12a16;
    stim[46] = 33'h09b618b51;
    stim[47] = 33'h0bbd39b9d;
    stim[48] = 33'h0f4689a40;
    stim[49] = 33'h18dd5f706;
    stim[50] = 33'h062bafff2;
    stim[51] = 33'h09f6a1d52;
    stim[52] = 33'h036b72da6;
    stim[53] = 33'h0ba0157b6;
    stim[54] = 33'h0db237f88;
    stim[55] = 33'h0d8917b65;
    stim[56] = 33'h002288783;
    stim[57] = 33'h071fb7754;
    stim[58] = 33'h08a50497f;
    stim[59] = 33'h0dd21965a;
    stim[60] = 33'h0cb2eefff;
    stim[61] = 33'h0e333c58e;
    stim[62] = 33'h0b7c49e41;
    stim[63] = 33'h0d51642cc;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h0904fc6dd;
      expv[4] = 33'h0904fc6dc;
      expv[5] = 33'h020414153;
      expv[6] = 33'h0904fc6dc;
      expv[7] = 33'h1e9df65db;
      expv[8] = 33'h17c79fb69;
      expv[9] = 33'h1e9df65da;
      expv[10] = 33'h0904fc6dc;
      expv[11] = 33'h0904fc6dc;
      expv[12] = 33'h0904fc6dc;
      expv[13] = 33'h0904fc6dc;
      expv[14] = 33'h17c79fb68;
      expv[15] = 33'h1e9df65da;
      expv[16] = 33'h17c79fb68;
      expv[17] = 33'h0904fc6dc;
      expv[18] = 33'h020414152;
      expv[19] = 33'h1e9df65da;
      expv[20] = 33'h1e9df65da;
      expv[21] = 33'h0904fc6dc;
      expv[22] = 33'h0904fc6dc;
      expv[23] = 33'h020414152;
      expv[24] = 33'h020414152;
      expv[25] = 33'h020414152;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h17c79fb68;
      expv[29] = 33'h020414152;
      expv[30] = 33'h0904fc6dc;
      expv[31] = 33'h0904fc6dc;
      expv[32] = 33'h1e9df65da;
      expv[33] = 33'h020414152;
      expv[34] = 33'h1e9df65da;
      expv[35] = 33'h0904fc6dc;
      expv[36] = 33'h0904fc6dc;
      expv[37] = 33'h1e9df65da;
      expv[38] = 33'h17c79fb68;
      expv[39] = 33'h17c79fb68;
      expv[40] = 33'h17c79fb68;
      expv[41] = 33'h0904fc6dc;
      expv[42] = 33'h1e9df65da;
      expv[43] = 33'h1e9df65da;
      expv[44] = 33'h17c79fb68;
      expv[45] = 33'h020414152;
      expv[46] = 33'h020414152;
      expv[47] = 33'h17c79fb68;
      expv[48] = 33'h17c79fb68;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h0904fc6dc;
      expv[52] = 33'h17c79fb68;
      expv[53] = 33'h020414152;
      expv[54] = 33'h17c79fb68;
      expv[55] = 33'h1e9df65da;
      expv[56] = 33'h1e9df65da;
      expv[57] = 33'h020414152;
      expv[58] = 33'h0904fc6dc;
      expv[59] = 33'h17c79fb68;
      expv[60] = 33'h1e9df65da;
      expv[61] = 33'h1e9df65da;
      expv[62] = 33'h1e9df65da;
      expv[63] = 33'h17c79fb68;
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
