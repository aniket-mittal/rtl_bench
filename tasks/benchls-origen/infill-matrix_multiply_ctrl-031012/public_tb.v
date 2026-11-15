// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031012 dut (
    .clk(clk),
    .reset(in_vec[20:20]),
    .read_data(in_vec[19:0]),
    .i(out_vec[83:64]),
    .j(out_vec[63:44]),
    .read(out_vec[43:43]),
    .write(out_vec[42:42]),
    .index(out_vec[41:41]),
    .finish(out_vec[40:40]),
    .write_data(out_vec[39:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h19a206;
    stim[1] = 21'h17b03c;
    stim[2] = 21'h032303;
    stim[3] = 21'h0d355e;
    stim[4] = 21'h020963;
    stim[5] = 21'h023cff;
    stim[6] = 21'h0ea334;
    stim[7] = 21'h0f7185;
    stim[8] = 21'h0f4891;
    stim[9] = 21'h07b16d;
    stim[10] = 21'h0af24a;
    stim[11] = 21'h083f68;
    stim[12] = 21'h0f3322;
    stim[13] = 21'h03f499;
    stim[14] = 21'h0500a5;
    stim[15] = 21'h0ed48d;
    stim[16] = 21'h0c7e84;
    stim[17] = 21'h0b8ca4;
    stim[18] = 21'h03c64d;
    stim[19] = 21'h04f18a;
    stim[20] = 21'h0bfb01;
    stim[21] = 21'h0082f6;
    stim[22] = 21'h0869c8;
    stim[23] = 21'h0a42cf;
    stim[24] = 21'h08ba2b;
    stim[25] = 21'h03b74f;
    stim[26] = 21'h0aa3a9;
    stim[27] = 21'h044622;
    stim[28] = 21'h01db12;
    stim[29] = 21'h059d06;
    stim[30] = 21'h0d1da1;
    stim[31] = 21'h02555d;
    stim[32] = 21'h0181f3;
    stim[33] = 21'h0f60fc;
    stim[34] = 21'h051c0e;
    stim[35] = 21'h0d92c7;
    stim[36] = 21'h0acf3a;
    stim[37] = 21'h0cae81;
    stim[38] = 21'h0265ea;
    stim[39] = 21'h094854;
    stim[40] = 21'h0bc0d5;
    stim[41] = 21'h054626;
    stim[42] = 21'h0a05b9;
    stim[43] = 21'h026fdb;
    stim[44] = 21'h0c0603;
    stim[45] = 21'h058100;
    stim[46] = 21'h0b3545;
    stim[47] = 21'h0ea165;
    stim[48] = 21'h0bff1e;
    stim[49] = 21'h0ebd23;
    stim[50] = 21'h08edfd;
    stim[51] = 21'h037b18;
    stim[52] = 21'h0d9742;
    stim[53] = 21'h05c470;
    stim[54] = 21'h00c4c4;
    stim[55] = 21'h079431;
    stim[56] = 21'h0d6bed;
    stim[57] = 21'h0a47eb;
    stim[58] = 21'h06f15f;
    stim[59] = 21'h0a58bf;
    stim[60] = 21'h0e8874;
    stim[61] = 21'h09bd8d;
    stim[62] = 21'h07cecb;
    stim[63] = 21'h0e68de;
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
      expv[0] = 84'h0000000000cxxxxxxxxxx;
      expv[1] = 84'h0000000000cxxxxxxxxxx;
      expv[2] = 84'h0000000000cxxxxxxxxxx;
      expv[3] = 84'h0000000000cxxxxxxxxxx;
      expv[4] = 84'h0000000001cxxxxxxxxxx;
      expv[5] = 84'h0000000002cxxxxxxxxxx;
      expv[6] = 84'h00000000038xxxxxxxxxx;
      expv[7] = 84'h00000000048xxxxxxxxxx;
      expv[8] = 84'h00000000058xxxxxxxxxx;
      expv[9] = 84'h00000000068xxxxxxxxxx;
      expv[10] = 84'h00000000078xxxxxxxxxx;
      expv[11] = 84'h00000000088xxxxxxxxxx;
      expv[12] = 84'h00000000098xxxxxxxxxx;
      expv[13] = 84'h000000000a8xxxxxxxxxx;
      expv[14] = 84'h000000000b8xxxxxxxxxx;
      expv[15] = 84'h000000000c8xxxxxxxxxx;
      expv[16] = 84'h000000000d8xxxxxxxxxx;
      expv[17] = 84'h000000000e8xxxxxxxxxx;
      expv[18] = 84'h000000000f8xxxxxxxxxx;
      expv[19] = 84'h00000000108xxxxxxxxxx;
      expv[20] = 84'h00000000118xxxxxxxxxx;
      expv[21] = 84'h00000000128xxxxxxxxxx;
      expv[22] = 84'h00000000138xxxxxxxxxx;
      expv[23] = 84'h00000000148xxxxxxxxxx;
      expv[24] = 84'h00000000158xxxxxxxxxx;
      expv[25] = 84'h00000000168xxxxxxxxxx;
      expv[26] = 84'h00000000178xxxxxxxxxx;
      expv[27] = 84'h00000000188xxxxxxxxxx;
      expv[28] = 84'h00000000198xxxxxxxxxx;
      expv[29] = 84'h000000001a8xxxxxxxxxx;
      expv[30] = 84'h000000001b8xxxxxxxxxx;
      expv[31] = 84'h000000001c8xxxxxxxxxx;
      expv[32] = 84'h000000001d8xxxxxxxxxx;
      expv[33] = 84'h000000001e8xxxxxxxxxx;
      expv[34] = 84'h000000001f8xxxxxxxxxx;
      expv[35] = 84'h00000000208xxxxxxxxxx;
      expv[36] = 84'h00000000218xxxxxxxxxx;
      expv[37] = 84'h00000000228xxxxxxxxxx;
      expv[38] = 84'h00000000238xxxxxxxxxx;
      expv[39] = 84'h00000000248xxxxxxxxxx;
      expv[40] = 84'h00000000258xxxxxxxxxx;
      expv[41] = 84'h00000000268xxxxxxxxxx;
      expv[42] = 84'h00000000278xxxxxxxxxx;
      expv[43] = 84'h00000000288xxxxxxxxxx;
      expv[44] = 84'h00000000298xxxxxxxxxx;
      expv[45] = 84'h000000002a8xxxxxxxxxx;
      expv[46] = 84'h000000002b8xxxxxxxxxx;
      expv[47] = 84'h000000002c8xxxxxxxxxx;
      expv[48] = 84'h000000002d8xxxxxxxxxx;
      expv[49] = 84'h000000002e8xxxxxxxxxx;
      expv[50] = 84'h000000002f8xxxxxxxxxx;
      expv[51] = 84'h00000000308xxxxxxxxxx;
      expv[52] = 84'h00000000318xxxxxxxxxx;
      expv[53] = 84'h00000000328xxxxxxxxxx;
      expv[54] = 84'h00000000338xxxxxxxxxx;
      expv[55] = 84'h00000000348xxxxxxxxxx;
      expv[56] = 84'h00000000358xxxxxxxxxx;
      expv[57] = 84'h00000000368xxxxxxxxxx;
      expv[58] = 84'h00000000378xxxxxxxxxx;
      expv[59] = 84'h00000000388xxxxxxxxxx;
      expv[60] = 84'h00000000398xxxxxxxxxx;
      expv[61] = 84'h000000003a8xxxxxxxxxx;
      expv[62] = 84'h000000003b8xxxxxxxxxx;
      expv[63] = 84'h000000003c8xxxxxxxxxx;
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
