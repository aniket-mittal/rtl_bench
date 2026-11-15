// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10821 dut (
    .CLK(clk),
    .SLOT(in_vec[82:82]),
    .WRREG_Z(in_vec[81:81]),
    .WRREG_W(in_vec[80:80]),
    .REGNUM_X(in_vec[79:76]),
    .REGNUM_Y(in_vec[75:72]),
    .REGNUM_Z(in_vec[71:68]),
    .REGNUM_W(in_vec[67:64]),
    .ZBUS(in_vec[63:32]),
    .WBUS(in_vec[31:0]),
    .REG_X(out_vec[95:64]),
    .REG_Y(out_vec[63:32]),
    .REG_0(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h028b27b43c466a0873138;
    stim[1] = 83'h3d3783042462e8e37ccf2;
    stim[2] = 83'h698a4823cef530a581a55;
    stim[3] = 83'h5b8fe0290aa1237152088;
    stim[4] = 83'h2d8788481c1195c119a8f;
    stim[5] = 83'h38766fdd3e398963972a4;
    stim[6] = 83'h242e914636ca6aa72f0bb;
    stim[7] = 83'h27bde7c5aa434c480e069;
    stim[8] = 83'h40ac1e1b615dd27c124e7;
    stim[9] = 83'h02ae435e7dc4c11ad7463;
    stim[10] = 83'h490063612f1652c06b712;
    stim[11] = 83'h75d5d7e9d09554dd4397d;
    stim[12] = 83'h3ee52db1d2619e875cbca;
    stim[13] = 83'h596222a9c158877f294ee;
    stim[14] = 83'h38858aa2a00f1f783cda6;
    stim[15] = 83'h56b06bb625e7b7bc9c14e;
    stim[16] = 83'h7bd8d8f30e96dbab794ab;
    stim[17] = 83'h17b5cfe3ff44ce5322e5c;
    stim[18] = 83'h57701181709955617c0cd;
    stim[19] = 83'h62253bc6f733c4c850f5b;
    stim[20] = 83'h47c3fc00757f473e9b480;
    stim[21] = 83'h0dab12d8a76d004e4178b;
    stim[22] = 83'h483881be3bbb39e511787;
    stim[23] = 83'h1a1baeb3e55d6138db91c;
    stim[24] = 83'h5e0606a173e3c9dd77ceb;
    stim[25] = 83'h760a8907bed95ee55bfa1;
    stim[26] = 83'h431d6b66e6d5b53d9730f;
    stim[27] = 83'h1580ecfd5497ad42ede5d;
    stim[28] = 83'h0f33229764ba2baea6e83;
    stim[29] = 83'h290f6f9be129645be78d1;
    stim[30] = 83'h13383ca9cba16fcb253f6;
    stim[31] = 83'h184c1821c5e1b12aee6d6;
    stim[32] = 83'h5a3454065a986a194bfa4;
    stim[33] = 83'h5494e947d07695fef9096;
    stim[34] = 83'h051bcb8752483e49d66ca;
    stim[35] = 83'h5ad430a54960fd3994ea0;
    stim[36] = 83'h1be27d5cba3b39542280f;
    stim[37] = 83'h5f3adec361155d412c181;
    stim[38] = 83'h761fa69524ca704868090;
    stim[39] = 83'h3424a4cad8a5a071f5f7c;
    stim[40] = 83'h58694d864603a3c948434;
    stim[41] = 83'h26c088cb7ee2810e83f52;
    stim[42] = 83'h248b83d113f202d99a65b;
    stim[43] = 83'h57c7a34232f3a057ac13c;
    stim[44] = 83'h54459dc42767547b61661;
    stim[45] = 83'h4dbf0e2d194a68e1ca1d0;
    stim[46] = 83'h6a1606fd6c3ffe066cee1;
    stim[47] = 83'h217c5ef2d1b526456893a;
    stim[48] = 83'h49b9db951e9f9eb296a2f;
    stim[49] = 83'h3481b94cc6a0155abf01b;
    stim[50] = 83'h781b4df59b4c6d598888c;
    stim[51] = 83'h61b932e765b48b552875e;
    stim[52] = 83'h1956062cfeaa4a8cf9373;
    stim[53] = 83'h41e06b417afa83a035ee5;
    stim[54] = 83'h181e113cf72c1229f8959;
    stim[55] = 83'h67618145eba64754f09ff;
    stim[56] = 83'h39aa80f02c9107014aefb;
    stim[57] = 83'h7255b5b976b6df89314fd;
    stim[58] = 83'h6ecfbec80828899bd2b9d;
    stim[59] = 83'h63bfbfea507e2ac124ed5;
    stim[60] = 83'h571e83dbf70f9e9a5d53d;
    stim[61] = 83'h1e75bde26927c399ccf38;
    stim[62] = 83'h6e55906dfd8b86888e6d9;
    stim[63] = 83'h222d8f91e01ecff47b19b;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 96'hxxxxxxxx823cef53xxxxxxxx;
      expv[9] = 96'hxxxxxxxx823cef53xxxxxxxx;
      expv[10] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 96'h3715208837152088xxxxxxxx;
      expv[13] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 96'hxxxxxxxx4dd4397dxxxxxxxx;
      expv[17] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 96'h77f294ee77f294eexxxxxxxx;
      expv[20] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 96'hbab794ab823cef53xxxxxxxx;
      expv[22] = 96'h8f30e96dxxxxxxxxxxxxxxxx;
      expv[23] = 96'h823cef535617c0cdxxxxxxxx;
      expv[24] = 96'h37152088xxxxxxxxxxxxxxxx;
      expv[25] = 96'h7bc9c14e9dd77ceb9dd77ceb;
      expv[26] = 96'hxxxxxxxx5617c0cd9dd77ceb;
      expv[27] = 96'hbc6f733cee55bfa19dd77ceb;
      expv[28] = 96'hxxxxxxxxxxxxxxxx9dd77ceb;
      expv[29] = 96'hxxxxxxxx9dd77ceb9dd77ceb;
      expv[30] = 96'hxxxxxxxxxxxxxxxx9dd77ceb;
      expv[31] = 96'hee55bfa1xxxxxxxx9dd77ceb;
      expv[32] = 96'h907bed95xxxxxxxx9dd77ceb;
      expv[33] = 96'hxxxxxxxxxxxxxxxx9dd77ceb;
      expv[34] = 96'ha194bfa45617c0cd9dd77ceb;
      expv[35] = 96'h907bed95bab794ab9dd77ceb;
      expv[36] = 96'hxxxxxxxx5fef90969dd77ceb;
      expv[37] = 96'hxxxxxxxxd3994ea09dd77ceb;
      expv[38] = 96'h7bc9c14e5617c0cd9dd77ceb;
      expv[39] = 96'hxxxxxxxx77f294ee9dd77ceb;
      expv[40] = 96'hee55bfa17bc9c14e9dd77ceb;
      expv[41] = 96'h7bc9c14exxxxxxxx9dd77ceb;
      expv[42] = 96'h3c948434ee55bfa19dd77ceb;
      expv[43] = 96'hxxxxxxxxxxxxxxxx9dd77ceb;
      expv[44] = 96'h3c9484343c9484349dd77ceb;
      expv[45] = 96'hd412c181xxxxxxxx9dd77ceb;
      expv[46] = 96'h057ac13c5617c0cd9dd77ceb;
      expv[47] = 96'h5617c0cdxxxxxxxx9dd77ceb;
      expv[48] = 96'h47b61661xxxxxxxx9dd77ceb;
      expv[49] = 96'h3c948434ee55bfa19dd77ceb;
      expv[50] = 96'hee55bfa15617c0cd9dd77ceb;
      expv[51] = 96'h5617c0cddf59b4c69dd77ceb;
      expv[52] = 96'h2e765b48a194bfa49dd77ceb;
      expv[53] = 96'h5617c0cd5fef90969dd77ceb;
      expv[54] = 96'hee55bfa15617c0cd9dd77ceb;
      expv[55] = 96'hxxxxxxxx6fd6c3ff9dd77ceb;
      expv[56] = 96'h2e765b48057ac13c9dd77ceb;
      expv[57] = 96'h77f294eea194bfa49dd77ceb;
      expv[58] = 96'h5fef9096xxxxxxxx9dd77ceb;
      expv[59] = 96'hd3994ea0f89314fd9dd77ceb;
      expv[60] = 96'hxxxxxxxx145eba649dd77ceb;
      expv[61] = 96'h5fef9096xxxxxxxx9dd77ceb;
      expv[62] = 96'h5fef90965b976b6d9dd77ceb;
      expv[63] = 96'h77f294ee77f294ee9dd77ceb;
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
