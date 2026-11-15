// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_159858 dut (
    .clk(clk),
    .rst(in_vec[68:68]),
    .sop(in_vec[67:67]),
    .eop(in_vec[66:66]),
    .data(in_vec[65:2]),
    .dval(in_vec[1:1]),
    .axi_rdy(in_vec[0:0]),
    .rdy(out_vec[66:66]),
    .axi_data(out_vec[65:2]),
    .axi_valid(out_vec[1:1]),
    .axi_last(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h194f2e0ec7c4a771b1;
    stim[1] = 69'h1b5e6136422939cf09;
    stim[2] = 69'h091c9e59cdb8823c1c;
    stim[3] = 69'h031cccdd7afdaa4106;
    stim[4] = 69'h06d74d294cf6ee3a3a;
    stim[5] = 69'h0895a1f268924ec929;
    stim[6] = 69'h0a08da1129ef34ab9b;
    stim[7] = 69'h09fb606accd63c0901;
    stim[8] = 69'h096d1f69a076710242;
    stim[9] = 69'h0c7189e740b8d1ec2a;
    stim[10] = 69'h0f71eb10ab20215547;
    stim[11] = 69'h0dbfa246dcd6777f46;
    stim[12] = 69'h0c7edb3e8a9a25f23c;
    stim[13] = 69'h029d45f75f48e3209c;
    stim[14] = 69'h071f3409099c2d031c;
    stim[15] = 69'h041d18ea4694c5fb5c;
    stim[16] = 69'h0ff4fc5f7ad0d33e2b;
    stim[17] = 69'h01d77fceb99dd13c43;
    stim[18] = 69'h0fe29063edad0ee16b;
    stim[19] = 69'h05ca1e8c0e60b3853e;
    stim[20] = 69'h0f19b79b100ba8d33d;
    stim[21] = 69'h04f16723e1922de0aa;
    stim[22] = 69'h03e450e4a5a90bcbd8;
    stim[23] = 69'h072490582d1279fb5e;
    stim[24] = 69'h0c7c9b1f324d11d297;
    stim[25] = 69'h03542fcf50c1f272d6;
    stim[26] = 69'h043e612e57b2db6dc8;
    stim[27] = 69'h0a4242c78f4e8b6462;
    stim[28] = 69'h0c652cc481a673167f;
    stim[29] = 69'h0aacac9f9a0d15b016;
    stim[30] = 69'h0738283d8556426a57;
    stim[31] = 69'h062aa7e3d90f101f41;
    stim[32] = 69'h019bc539e9d7aaa84e;
    stim[33] = 69'h0e1c4f3e6036a0b425;
    stim[34] = 69'h0180cb5a9ced537580;
    stim[35] = 69'h0fe2e6ffadfc14c299;
    stim[36] = 69'h0d995f6e5d3783643a;
    stim[37] = 69'h084776135877baca04;
    stim[38] = 69'h05ef365dacf369c0ed;
    stim[39] = 69'h0639d2aa9297f74e95;
    stim[40] = 69'h0e5714ae3f801629ba;
    stim[41] = 69'h0588bf4f5902dd5a43;
    stim[42] = 69'h056b34a22d5c73e506;
    stim[43] = 69'h0f1e2f372daa635802;
    stim[44] = 69'h0c156c2ca9fff60565;
    stim[45] = 69'h0b64a3dd67a3bcd7a8;
    stim[46] = 69'h08e1b262e201cd7a2f;
    stim[47] = 69'h0edf140495c1caaf2a;
    stim[48] = 69'h0d3641eacc17968860;
    stim[49] = 69'h0806c69e3a8aed5268;
    stim[50] = 69'h07f36b2a8bf631b0a6;
    stim[51] = 69'h08a20249efea92d543;
    stim[52] = 69'h06574aeeb7ecb33c81;
    stim[53] = 69'h07c6c4911c5e7ad484;
    stim[54] = 69'h07900a826948377606;
    stim[55] = 69'h04382369cae3fdd765;
    stim[56] = 69'h081616e11864e2ec03;
    stim[57] = 69'h0cca11b00cf18a24f2;
    stim[58] = 69'h0946304302701522ea;
    stim[59] = 69'h0a719eb70ae2d21d49;
    stim[60] = 69'h0d8716c0f4d869142a;
    stim[61] = 69'h0bd32e336149a648cb;
    stim[62] = 69'h00febad8e2f6f8bee6;
    stim[63] = 69'h0cf3bed34bd9c24f65;
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
      expv[0] = 67'h54f2e0ec7c4a771b0;
      expv[1] = 67'h75e6136422939cf08;
      expv[2] = 67'h11c9e59cdb8823c1c;
      expv[3] = 67'h31cccdd7afdaa4106;
      expv[4] = 67'h31cccdd7afdaa4106;
      expv[5] = 67'h71cccdd7afdaa4106;
      expv[6] = 67'h6d74d294cf6ee3a3a;
      expv[7] = 67'h608da1129ef34ab9a;
      expv[8] = 67'h16d1f69a076710242;
      expv[9] = 67'h16d1f69a076710242;
      expv[10] = 67'h56d1f69a076710242;
      expv[11] = 67'h07189e740b8d1ec2a;
      expv[12] = 67'h07189e740b8d1ec2a;
      expv[13] = 67'h07189e740b8d1ec2a;
      expv[14] = 67'h07189e740b8d1ec2a;
      expv[15] = 67'h07189e740b8d1ec2a;
      expv[16] = 67'h47189e740b8d1ec2a;
      expv[17] = 67'h771eb10ab20215546;
      expv[18] = 67'h5bfa246dcd6777f46;
      expv[19] = 67'h3f4fc5f7ad0d33e2a;
      expv[20] = 67'h7f4fc5f7ad0d33e2a;
      expv[21] = 67'h1d77fceb99dd13c42;
      expv[22] = 67'h1d77fceb99dd13c42;
      expv[23] = 67'h1d77fceb99dd13c42;
      expv[24] = 67'h5d77fceb99dd13c42;
      expv[25] = 67'h3e29063edad0ee16a;
      expv[26] = 67'h3e29063edad0ee16a;
      expv[27] = 67'h3e29063edad0ee16a;
      expv[28] = 67'h7e29063edad0ee16a;
      expv[29] = 67'h1ca1e8c0e60b3853e;
      expv[30] = 67'h738283d8556426a56;
      expv[31] = 67'h62aa7e3d90f101f40;
      expv[32] = 67'h19bc539e9d7aaa84f;
      expv[33] = 67'h59bc539e9d7aaa84e;
      expv[34] = 67'h180cb5a9ced537581;
      expv[35] = 67'h7e2e6ffadfc14c298;
      expv[36] = 67'h1995f6e5d3783643a;
      expv[37] = 67'h1995f6e5d3783643a;
      expv[38] = 67'h5995f6e5d3783643a;
      expv[39] = 67'h639d2aa9297f74e94;
      expv[40] = 67'h25714ae3f801629ba;
      expv[41] = 67'h65714ae3f801629ba;
      expv[42] = 67'h188bf4f5902dd5a42;
      expv[43] = 67'h188bf4f5902dd5a42;
      expv[44] = 67'h588bf4f5902dd5a42;
      expv[45] = 67'h16b34a22d5c73e506;
      expv[46] = 67'h56b34a22d5c73e506;
      expv[47] = 67'h31e2f372daa635802;
      expv[48] = 67'h31e2f372daa635802;
      expv[49] = 67'h31e2f372daa635802;
      expv[50] = 67'h31e2f372daa635802;
      expv[51] = 67'h71e2f372daa635802;
      expv[52] = 67'h4e1b262e201cd7a2e;
      expv[53] = 67'h2df140495c1caaf2a;
      expv[54] = 67'h2df140495c1caaf2a;
      expv[55] = 67'h6df140495c1caaf2a;
      expv[56] = 67'h7f36b2a8bf631b0a6;
      expv[57] = 67'h0a20249efea92d542;
      expv[58] = 67'h0a20249efea92d542;
      expv[59] = 67'h4a20249efea92d542;
      expv[60] = 67'h3900a826948377606;
      expv[61] = 67'h7900a826948377606;
      expv[62] = 67'h01616e11864e2ec02;
      expv[63] = 67'h41616e11864e2ec02;
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
