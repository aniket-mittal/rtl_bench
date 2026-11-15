// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014866 dut (
    .A(in_vec[70:39]),
    .B(in_vec[38:7]),
    .ALUFun(in_vec[6:1]),
    .Sign(in_vec[0:0]),
    .Z(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h2114ef6743c9324d6b;
    stim[1] = 71'h5f981c0f2132950c7f;
    stim[2] = 71'h316eb0ee519263c418;
    stim[3] = 71'h08544134154fddcc2c;
    stim[4] = 71'h22216f852725aa0d7d;
    stim[5] = 71'h1f1660a90bbea622a0;
    stim[6] = 71'h355a31f95cba7b4581;
    stim[7] = 71'h7c242f5e794e85b2e1;
    stim[8] = 71'h0e161a657bcd41f360;
    stim[9] = 71'h1fc3cfd3ccc38da81c;
    stim[10] = 71'h172c977f6fcf0a3b4d;
    stim[11] = 71'h255b16ceb628479bf3;
    stim[12] = 71'h431a4439949b6fcefa;
    stim[13] = 71'h1d972b9e3cbb218b72;
    stim[14] = 71'h0075a4051312a75965;
    stim[15] = 71'h4f74c0743ca44d1856;
    stim[16] = 71'h63b04bb4fc3898eab1;
    stim[17] = 71'h17f7ce0931fcc2afa5;
    stim[18] = 71'h5e74f26ffe5fdf8c21;
    stim[19] = 71'h0ecb6869e6520c9614;
    stim[20] = 71'h1169bed969ca2d88cd;
    stim[21] = 71'h3f257e9d4114f7fe2e;
    stim[22] = 71'h7fb5c5a4c9fa0b6c21;
    stim[23] = 71'h4045ebb656d8f2b2c3;
    stim[24] = 71'h666c23a5cd0938a0c9;
    stim[25] = 71'h2dd2ec46d5464ade0d;
    stim[26] = 71'h25d2a3f0c680e8d4a4;
    stim[27] = 71'h1cee486178ac130195;
    stim[28] = 71'h5894b519b5c425d5eb;
    stim[29] = 71'h515a0d6194747abe0a;
    stim[30] = 71'h3419de38651f5d493c;
    stim[31] = 71'h51f8526d42f94bdc39;
    stim[32] = 71'h45d4c7ba00ab364eac;
    stim[33] = 71'h60aa9d133bd7443996;
    stim[34] = 71'h710cf95efdb6502b7d;
    stim[35] = 71'h4a49a936ef903b16d6;
    stim[36] = 71'h116b9994287189cba4;
    stim[37] = 71'h67690e4e5b16f3a327;
    stim[38] = 71'h6be5d9ef72e3d20d2f;
    stim[39] = 71'h737a16fd3e8d9cf73d;
    stim[40] = 71'h67a8f19b047c5970d4;
    stim[41] = 71'h3da9c3f8f350801d38;
    stim[42] = 71'h173976cab5f64e138b;
    stim[43] = 71'h32f2a8e227b514b959;
    stim[44] = 71'h3f231ac525435abef1;
    stim[45] = 71'h3045aa12194cb53129;
    stim[46] = 71'h1e2128a3296b232416;
    stim[47] = 71'h31d1595b6ab3013df7;
    stim[48] = 71'h65bd9724dfd77503e1;
    stim[49] = 71'h2b82fbb27ab7319e26;
    stim[50] = 71'h0808c8495a2318d296;
    stim[51] = 71'h0ccf26fb58eb9b6ed3;
    stim[52] = 71'h2a16ee05ec349a37db;
    stim[53] = 71'h25c3181528a862950c;
    stim[54] = 71'h513a046eb558310d8d;
    stim[55] = 71'h2e2a32fcb8d0e1ea22;
    stim[56] = 71'h4a130ec399408c2336;
    stim[57] = 71'h38a7e17f40e0f16a69;
    stim[58] = 71'h6ef356595a75733cc8;
    stim[59] = 71'h5df35693da4c412c67;
    stim[60] = 71'h23639601958f958b28;
    stim[61] = 71'h60cad0282748ef990e;
    stim[62] = 71'h0190f3e9a5ff8838f8;
    stim[63] = 71'h1088118df910fb3832;
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
      expv[0] = 32'h00000001;
      expv[1] = 32'h00000000;
      expv[2] = 32'h06022964;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h162c4040;
      expv[6] = 32'h24295a7d;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'hd90ebaf7;
      expv[10] = 32'h000000b9;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000001;
      expv[13] = 32'h00000001;
      expv[14] = 32'h00000000;
      expv[15] = 32'h9ee980e8;
      expv[16] = 32'h00000000;
      expv[17] = 32'h4c16194d;
      expv[18] = 32'hbca9a418;
      expv[19] = 32'hea3ae9ff;
      expv[20] = 32'h00001169;
      expv[21] = 32'h00000000;
      expv[22] = 32'h93600248;
      expv[23] = 32'h04045ebb;
      expv[24] = 32'h99b08e96;
      expv[25] = 32'h06326e49;
      expv[26] = 32'hc6a49648;
      expv[27] = 32'h2b34b6c5;
      expv[28] = 32'h00000001;
      expv[29] = 32'h79cb2547;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h49a6b1b3;
      expv[34] = 32'h00000000;
      expv[35] = 32'h9493526d;
      expv[36] = 32'h723420bf;
      expv[37] = 32'h312de363;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'he7a8f19b;
      expv[41] = 32'h00000000;
      expv[42] = 32'hc286516e;
      expv[43] = 32'h47100000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'he96c0afe;
      expv[47] = 32'h00000001;
      expv[48] = 32'h00000000;
      expv[49] = 32'ha8fa089b;
      expv[50] = 32'h5bcb5eed;
      expv[51] = 32'h00000000;
      expv[52] = 32'h0000a85b;
      expv[53] = 32'h9cd6f554;
      expv[54] = 32'h0d246af8;
      expv[55] = 32'h7df5e7fd;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000001;
      expv[58] = 32'h64000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h7303c11e;
      expv[62] = 32'h00000001;
      expv[63] = 32'h00000000;
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
