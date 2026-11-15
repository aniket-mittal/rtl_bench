// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_142549 dut (
    .clk(clk),
    .reset(in_vec[64:64]),
    .x0(in_vec[63:48]),
    .x1(in_vec[47:32]),
    .x2(in_vec[31:16]),
    .x3(in_vec[15:0]),
    .y0(out_vec[64:49]),
    .y1(out_vec[48:33]),
    .y2(out_vec[32:17]),
    .y3(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h14f49c73da06d44ee;
    stim[1] = 65'h11e2c9abfab6fab86;
    stim[2] = 65'h0ef1747fbefcf0d68;
    stim[3] = 65'h039b4ce853246fe54;
    stim[4] = 65'h034cac91bde364168;
    stim[5] = 65'h02df897ddc4dd3a6c;
    stim[6] = 65'h09294b7445e484810;
    stim[7] = 65'h0c39e181618a78c82;
    stim[8] = 65'h0b077372af23914dc;
    stim[9] = 65'h0e0dd892e37fd3722;
    stim[10] = 65'h0ae91c8e7042b3f33;
    stim[11] = 65'h06ba2cd37204bdc90;
    stim[12] = 65'h0fd481cc6d72210d6;
    stim[13] = 65'h05ef0dc45925eb583;
    stim[14] = 65'h09e27268d5f7f5817;
    stim[15] = 65'h02724724ee0452c2c;
    stim[16] = 65'h0395f5d7c0fb28d2e;
    stim[17] = 65'h0c641f3242ee1ca0e;
    stim[18] = 65'h0be6a42612df53514;
    stim[19] = 65'h00492096060649f15;
    stim[20] = 65'h014962557664ceca0;
    stim[21] = 65'h0e5381563aeecafdc;
    stim[22] = 65'h0310162c2f267b292;
    stim[23] = 65'h0425a80aa144767be;
    stim[24] = 65'h0e697100fb2081977;
    stim[25] = 65'h0073e67312558d789;
    stim[26] = 65'h1f8ad2525b8c20b66;
    stim[27] = 65'h0163e2f8f26682f5a;
    stim[28] = 65'h07853c34460123d76;
    stim[29] = 65'h04cc5a2fceed83776;
    stim[30] = 65'h04a02482465708e70;
    stim[31] = 65'h096e3d94666d1e983;
    stim[32] = 65'h05c2ac0a4b45ba3af;
    stim[33] = 65'h0d4b2db362ccd3cbb;
    stim[34] = 65'h082fdd446a406470e;
    stim[35] = 65'h06513092317c0deb3;
    stim[36] = 65'h0b25dc65b62e1a500;
    stim[37] = 65'h0ca0ade6c5808186b;
    stim[38] = 65'h0694aefbdba9776ec;
    stim[39] = 65'h07ecdf3737ebcf74d;
    stim[40] = 65'h01618dd8586e0da3e;
    stim[41] = 65'h01888e8c9f16536f5;
    stim[42] = 65'h0598b3140ff71313a;
    stim[43] = 65'h0471746647682121a;
    stim[44] = 65'h0f2fb8186fce4ad94;
    stim[45] = 65'h0100f1037c05de1c6;
    stim[46] = 65'h06ec9167b420ef819;
    stim[47] = 65'h0cbc5970302721461;
    stim[48] = 65'h0a48dae3776a1b0d9;
    stim[49] = 65'h07343a5d1b4f4d8c6;
    stim[50] = 65'h0a34850240baaa70f;
    stim[51] = 65'h082465f33fdb87765;
    stim[52] = 65'h0722920d008d4c321;
    stim[53] = 65'h1d458a41d5eeeeaac;
    stim[54] = 65'h0cc62296b1170bc85;
    stim[55] = 65'h01786100a1fed3627;
    stim[56] = 65'h00a562dd8cc05e827;
    stim[57] = 65'h0f8ab334fbc7195eb;
    stim[58] = 65'h0e1b8fdf0a6db9a74;
    stim[59] = 65'h058ad6585e5bf6fb6;
    stim[60] = 65'h06d6e7aace40be61e;
    stim[61] = 65'h0a969f050332a5cf7;
    stim[62] = 65'h0c894d8a3612e0d3c;
    stim[63] = 65'h078ee2e32f4b3f497;
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
      expv[1] = 65'hxxxxxxxxxxxxxxxxx;
      expv[2] = 65'hxxxxxxxxxxxxxxxxx;
      expv[3] = 65'hxxxxxxxxxxxxxxxxx;
      expv[4] = 65'hxxxxxxxxxxxxxxxxx;
      expv[5] = 65'h06e254e39fa6fc4cf;
      expv[6] = 65'h06e254e39fa6fc4cf;
      expv[7] = 65'h06e254e39fa6fc4cf;
      expv[8] = 65'h18bab2c37fe9314e3;
      expv[9] = 65'h18bab2c37fe9314e3;
      expv[10] = 65'h18bab2c37fe9314e3;
      expv[11] = 65'h1cf42f29a0e2bbabb;
      expv[12] = 65'h1cf42f29a0e2bbabb;
      expv[13] = 65'h1cf42f29a0e2bbabb;
      expv[14] = 65'h071b33cd7f9b68777;
      expv[15] = 65'h071b33cd7f9b68777;
      expv[16] = 65'h071b33cd7f9b68777;
      expv[17] = 65'h18968ef356f2c0ed1;
      expv[18] = 65'h18968ef356f2c0ed1;
      expv[19] = 65'h18968ef356f2c0ed1;
      expv[20] = 65'h172cba63bf1dec9a7;
      expv[21] = 65'h172cba63bf1dec9a7;
      expv[22] = 65'h172cba63bf1dec9a7;
      expv[23] = 65'h073dbde7ea5d8f359;
      expv[24] = 65'h073dbde7ea5d8f359;
      expv[25] = 65'h073dbde7ea5d8f359;
      expv[26] = 65'h186098360f80b5912;
      expv[27] = 65'h186098360f80b5912;
      expv[28] = 65'h186098360f80b5912;
      expv[29] = 65'h186098360f80b5912;
      expv[30] = 65'h08b9bcd5eab85ee1d;
      expv[31] = 65'h08b9bcd5eab85ee1d;
      expv[32] = 65'h08b9bcd5eab85ee1d;
      expv[33] = 65'h1244c03bde7c1ae01;
      expv[34] = 65'h1244c03bde7c1ae01;
      expv[35] = 65'h1244c03bde7c1ae01;
      expv[36] = 65'h15fd1f2f8d311e025;
      expv[37] = 65'h15fd1f2f8d311e025;
      expv[38] = 65'h15fd1f2f8d311e025;
      expv[39] = 65'h0f171d8040fc37bc3;
      expv[40] = 65'h0f171d8040fc37bc3;
      expv[41] = 65'h0f171d8040fc37bc3;
      expv[42] = 65'h0e48116b4ec130edf;
      expv[43] = 65'h0e48116b4ec130edf;
      expv[44] = 65'h0e48116b4ec130edf;
      expv[45] = 65'h11596509661579c6f;
      expv[46] = 65'h11596509661579c6f;
      expv[47] = 65'h11596509661579c6f;
      expv[48] = 65'h0408dffb14447bd2f;
      expv[49] = 65'h0408dffb14447bd2f;
      expv[50] = 65'h0408dffb14447bd2f;
      expv[51] = 65'h0a589ecac4ef58b91;
      expv[52] = 65'h0a589ecac4ef58b91;
      expv[53] = 65'h0a589ecac4ef58b90;
      expv[54] = 65'h0a589ecac4ef58b90;
      expv[55] = 65'h0a589ecac4ef58b90;
      expv[56] = 65'h0a589ecac4ef58b90;
      expv[57] = 65'h1eb9b45ef9beaa9d7;
      expv[58] = 65'h1eb9b45ef9beaa9d7;
      expv[59] = 65'h1eb9b45ef9beaa9d7;
      expv[60] = 65'h057f58ab8a4b84d0d;
      expv[61] = 65'h057f58ab8a4b84d0d;
      expv[62] = 65'h057f58ab8a4b84d0d;
      expv[63] = 65'h1d035e5859453fbdb;
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
