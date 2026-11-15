// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024918 dut (
    .clk(clk),
    .reset(in_vec[81:81]),
    .rs1_sel(in_vec[80:76]),
    .rs2_sel(in_vec[75:71]),
    .rd_sel(in_vec[70:66]),
    .dest_enable(in_vec[65:65]),
    .dest_long_enable(in_vec[64:64]),
    .dest(in_vec[63:0]),
    .rs1_data(out_vec[127:64]),
    .rs2_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h22431d03876a4040dd9cc;
    stim[1] = 82'h32cc58db74de5934df92a;
    stim[2] = 82'h1b86f65ccb2a79a8c3b8c;
    stim[3] = 82'h19c77208bc1fb5d88eaef;
    stim[4] = 82'h0364fa5fcccb4f1a9bbb2;
    stim[5] = 82'h04832011ce4a44e2b9b78;
    stim[6] = 82'h0449b2c30ab40d755e06f;
    stim[7] = 82'h1aacd56b25eb4c931e019;
    stim[8] = 82'h1b7288b6e3afafc409ec5;
    stim[9] = 82'h1f5b152b73b0498764e73;
    stim[10] = 82'h0b1789765419ba8aba875;
    stim[11] = 82'h1119eb35d4b95c20a33ae;
    stim[12] = 82'h15cd2c9cbacaed07b8534;
    stim[13] = 82'h029105b1f4aea9e9c90bf;
    stim[14] = 82'h0971e2b2c6a235b73df22;
    stim[15] = 82'h1272f9254999e47c0045e;
    stim[16] = 82'h09633cf467a120fa93b38;
    stim[17] = 82'h1bb0cbe949d96b4faf565;
    stim[18] = 82'h1fc9bcb0e2868c94eb69d;
    stim[19] = 82'h11149fc9070fbde9447c5;
    stim[20] = 82'h1eecb874ee4f26fa31d21;
    stim[21] = 82'h03bcd7ee35c8eabdf01cf;
    stim[22] = 82'h10383cb7df51ed051ec4b;
    stim[23] = 82'h0cd3b71fe125db79f8137;
    stim[24] = 82'h0d6718f481b7cd6d79bd8;
    stim[25] = 82'h0149a32e4383c8363e5d2;
    stim[26] = 82'h032b00b638b032740b837;
    stim[27] = 82'h15de9e4f158ff65b25836;
    stim[28] = 82'h0af4ae8660dc5614cd282;
    stim[29] = 82'h1e35a85f439c23d92b3c9;
    stim[30] = 82'h0af420212ca213a967e20;
    stim[31] = 82'h17936a8dae80ad0f7ff97;
    stim[32] = 82'h0dbe6ff9bf0292ed7d002;
    stim[33] = 82'h11819068379e20065e9c6;
    stim[34] = 82'h0edbae185af9a0f193127;
    stim[35] = 82'h05706826771a076987e83;
    stim[36] = 82'h084fc02c74889e2be901c;
    stim[37] = 82'h01b582de4c987f95dccb2;
    stim[38] = 82'h04ff08b7d5f68795a0599;
    stim[39] = 82'h0354c216ed2f1caa949f6;
    stim[40] = 82'h11cd26961e1babe8eab71;
    stim[41] = 82'h1298d8c4d84c15ae8dd6a;
    stim[42] = 82'h1f5e193338571c9f64749;
    stim[43] = 82'h0cddd5583b8f8f635a517;
    stim[44] = 82'h1e1cbe1085d9da303dcf7;
    stim[45] = 82'h1e3f3680b471720fe3937;
    stim[46] = 82'h1f4d01004b727d014c5fe;
    stim[47] = 82'h076b93b279460f3e3dc04;
    stim[48] = 82'h19a7ff200cbbd8b6d51c7;
    stim[49] = 82'h17c94266562bce0857e66;
    stim[50] = 82'h1a19a7a810046bbac8754;
    stim[51] = 82'h13306742513e781468866;
    stim[52] = 82'h100779e44d1554caffe3a;
    stim[53] = 82'h0c3729fbdb8c4ba18747c;
    stim[54] = 82'h0f35f6f604f706032a160;
    stim[55] = 82'h13f95de766de332a929e3;
    stim[56] = 82'h0564cb549b0a95636c0bf;
    stim[57] = 82'h1f9cb7ade896788f0c130;
    stim[58] = 82'h05f7140a0c738b7ed45a4;
    stim[59] = 82'h08d1e57f00dcf96e5a373;
    stim[60] = 82'h0ba899602d94e8a121cfa;
    stim[61] = 82'h13af10a06b48dcd78c992;
    stim[62] = 82'h13c36fafa4d9a2803f7c2;
    stim[63] = 82'h0cb98ca857638117cb0be;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'h65ccb2a79a8c3b8cxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'h65ccb2a79a8c3b8cxxxxxxxxxxxxxxxx;
      expv[10] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'hxxxxxxxxxxxxxxxxcf467a120fa93b38;
      expv[18] = 128'h65ccb2a79a8c3b8cxxxxxxxxxxxxxxxx;
      expv[19] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 128'hxxxxxxxxxxxxxxxx208bc1fb5d88eaef;
      expv[22] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'hxxxxxxxxxxxxxxxxxxxxxxxx5b73df22;
      expv[24] = 128'hcf467a120fa93b38xxxxxxxxxxxxxxxx;
      expv[25] = 128'hxxxxxxxxxxxxxxxxcf467a120fa93b38;
      expv[26] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hxxxxxxxxxxxxxxxx65ccb2a79a8c3b8c;
      expv[29] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hxxxxxxxxxxxxxxxxcb0e28688363e5d2;
      expv[31] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'hxxxxxxxxxxxxxxxx874ee4f2614cd282;
      expv[33] = 128'hxxxxxxxxd0f7ff97xxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxx3a967e20;
      expv[35] = 128'h71fe125d0f19312765ccb2a79a8c3b8c;
      expv[36] = 128'hxxxxxxxxxxxxxxxx71fe125d0f193127;
      expv[37] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 128'hxxxxxxxx76987e83xxxxxxxx3d92b3c9;
      expv[39] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'hxxxxxxxxxxxxxxxxxxxxxxxx2ed7d002;
      expv[42] = 128'h874ee4f2614cd282a5fcccb4f1a9bbb2;
      expv[43] = 128'hxxxxxxxxxxxxxxxx9254999e47c0045e;
      expv[44] = 128'hcf467a120fa93b3865ccb2a79a8c3b8c;
      expv[45] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hxxxxxxxxxxxxxxxxxxxxxxxx5b73df22;
      expv[47] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'hxxxxxxxx5b73df22xxxxxxxxd0f7ff97;
      expv[49] = 128'hxxxxxxxx2ed7d002xxxxxxxxbe8eab71;
      expv[50] = 128'hxxxxxxxxxxxxxxxxxxxxxxxx2ed7d002;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'ha5fcccb4f1a9bbb2cb0e2868bbac8754;
      expv[53] = 128'hxxxxxxxx3a967e20cb7df51ed051ec4b;
      expv[54] = 128'hcf467a120fa93b38cb0e2868bbac8754;
      expv[55] = 128'hxxxxxxxxxxxxxxxxcb0e2868bbac8754;
      expv[56] = 128'ha5fcccb4f1a9bbb2f200cbbd8b6d51c7;
      expv[57] = 128'hxxxxxxxxxxxxxxxxcf467a120fa93b38;
      expv[58] = 128'hf200cbbd8b6d51c7a5fcccb4f1a9bbb2;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'h9254999e47c0045exxxxxxxxxxxxxxxx;
      expv[62] = 128'ha5fcccb4f1a9bbb2xxxxxxxxxxxxxxxx;
      expv[63] = 128'ha5fcccb4f1a9bbb2xxxxxxxxxxxxxxxx;
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
