// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  byte_to_word_fcs_sn_insert dut (
    .clk(clk),
    .rstn(in_vec[45:45]),
    .rstn_sn(in_vec[44:44]),
    .byte_in(in_vec[43:36]),
    .byte_in_strobe(in_vec[35:35]),
    .byte_count(in_vec[34:19]),
    .num_byte(in_vec[18:3]),
    .fcs_in_strobe(in_vec[2:2]),
    .fcs_ok(in_vec[1:1]),
    .rx_pkt_sn_plus_one(in_vec[0:0]),
    .word_out(out_vec[64:1]),
    .word_out_strobe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h10e8246b748d;
    stim[1] = 46'h0c4638e44128;
    stim[2] = 46'h221f08f8577f;
    stim[3] = 46'h304c47241dde;
    stim[4] = 46'h2dcf4ecf04c5;
    stim[5] = 46'h342a74931eb2;
    stim[6] = 46'h28423b210d5e;
    stim[7] = 46'h21d6f1285e93;
    stim[8] = 46'h2405d3421411;
    stim[9] = 46'h26cfa922e4fb;
    stim[10] = 46'h29d8aa0c9789;
    stim[11] = 46'h2cd67762385a;
    stim[12] = 46'h230ea430d52e;
    stim[13] = 46'h2fc0f75c4be3;
    stim[14] = 46'h3127142c2a7e;
    stim[15] = 46'h3357c02b5b53;
    stim[16] = 46'h294e668e9531;
    stim[17] = 46'h3cccb94e3d4b;
    stim[18] = 46'h2bb6bf2b1a38;
    stim[19] = 46'h3d7f7c5cd9da;
    stim[20] = 46'h378b7948e239;
    stim[21] = 46'h3141da682c3c;
    stim[22] = 46'h2d3db346d015;
    stim[23] = 46'h311d4d18172d;
    stim[24] = 46'h24dc2755d28b;
    stim[25] = 46'h3450bf7d8e10;
    stim[26] = 46'h2d248b81ed97;
    stim[27] = 46'h3d0ab0bcaf78;
    stim[28] = 46'h2fc7ff299ab4;
    stim[29] = 46'h32912127ab31;
    stim[30] = 46'h2792fd65ebd4;
    stim[31] = 46'h3490050ebc7e;
    stim[32] = 46'h3640513d2c60;
    stim[33] = 46'h3324471a3263;
    stim[34] = 46'h33007593500d;
    stim[35] = 46'h37105ceaf85a;
    stim[36] = 46'h344b0d5d6603;
    stim[37] = 46'h3e1a1ad9cfe5;
    stim[38] = 46'h27810c5308db;
    stim[39] = 46'h2aed9d38a289;
    stim[40] = 46'h33a826d163bb;
    stim[41] = 46'h3f988ad53131;
    stim[42] = 46'h391e64af5c5a;
    stim[43] = 46'h3039d9aba12b;
    stim[44] = 46'h31bb368cf75d;
    stim[45] = 46'h24d7576c8add;
    stim[46] = 46'h343de5922d30;
    stim[47] = 46'h3740d8f16aef;
    stim[48] = 46'h3d0d14087f35;
    stim[49] = 46'h21f8b5ca9f38;
    stim[50] = 46'h355c1a063eaa;
    stim[51] = 46'h26caf63cb68d;
    stim[52] = 46'h3ea09be97a62;
    stim[53] = 46'h3144fc12f336;
    stim[54] = 46'h253ea20bbecd;
    stim[55] = 46'h20f9f8a11c6e;
    stim[56] = 46'h24eac8901c9d;
    stim[57] = 46'h31a1cd1b669f;
    stim[58] = 46'h2920cbc086f4;
    stim[59] = 46'h2ba719eca179;
    stim[60] = 46'h275c7d3c37f9;
    stim[61] = 46'h2e46e16ff9c1;
    stim[62] = 46'h29a20e08cb6e;
    stim[63] = 46'h36cb785edd27;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000001;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h1a10023a602039929;
      expv[31] = 65'h1a10023a602039928;
      expv[32] = 65'h1a10023a602039928;
      expv[33] = 65'h1a10023a602039928;
      expv[34] = 65'h1a10023a602039928;
      expv[35] = 65'h1a10023a602039928;
      expv[36] = 65'h1a10023a602039928;
      expv[37] = 65'h1a10023a602039928;
      expv[38] = 65'h1a10023a602039928;
      expv[39] = 65'h1a10023a602039928;
      expv[40] = 65'h1a10023a602039928;
      expv[41] = 65'h1a10023a602039928;
      expv[42] = 65'h15dc289a10023a603;
      expv[43] = 65'h15dc289a10023a602;
      expv[44] = 65'h15dc289a10023a602;
      expv[45] = 65'h15dc289a10023a602;
      expv[46] = 65'h15dc289a10023a602;
      expv[47] = 65'h15dc289a10023a602;
      expv[48] = 65'h15dc289a10023a602;
      expv[49] = 65'h15dc289a10023a602;
      expv[50] = 65'h15dc289a10023a602;
      expv[51] = 65'h15dc289a10023a602;
      expv[52] = 65'h15dc289a10023a602;
      expv[53] = 65'h15dc289a10023a602;
      expv[54] = 65'h100aa01a002360807;
      expv[55] = 65'h100aa01a002360806;
      expv[56] = 65'h100aa01a002360806;
      expv[57] = 65'h100aa01a002360806;
      expv[58] = 65'h100aa01a002360806;
      expv[59] = 65'h100aa01a002360806;
      expv[60] = 65'h100aa01a002360806;
      expv[61] = 65'h100aa01a002360806;
      expv[62] = 65'h100aa01a002360806;
      expv[63] = 65'h10003000100aa01a1;
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
