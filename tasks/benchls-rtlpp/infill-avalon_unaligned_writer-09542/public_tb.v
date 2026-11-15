// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09542 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3178cbb749b4fd2c00;
    stim[1] = 70'h3152395509888b301c;
    stim[2] = 70'h0dd7da9492aa55c17a;
    stim[3] = 70'h1d47c87807ced61c0c;
    stim[4] = 70'h012685fad49ce014ce;
    stim[5] = 70'h167f2550899503e420;
    stim[6] = 70'h173c1b19157e39018f;
    stim[7] = 70'h0ebe8d8ef4e6921603;
    stim[8] = 70'h11ec113ba86954a3da;
    stim[9] = 70'h0cde7565af201c6158;
    stim[10] = 70'h0c425e605456c041f4;
    stim[11] = 70'h02794262737802499c;
    stim[12] = 70'h115b3b35240a753cd9;
    stim[13] = 70'h07e46eaf6217bbfc67;
    stim[14] = 70'h04f08cc70b5a7c8e4e;
    stim[15] = 70'h1b1747dbc97ad52572;
    stim[16] = 70'h02fa8ed625c14efdf5;
    stim[17] = 70'h1d51a6b81a305ca905;
    stim[18] = 70'h0f07a7527ee8529ee0;
    stim[19] = 70'h1176a43e101a75e498;
    stim[20] = 70'h0fdf4cbfbf5840feb7;
    stim[21] = 70'h16786c782df6fde80f;
    stim[22] = 70'h19f2d7f42cbcc1634d;
    stim[23] = 70'h008167530b515f1944;
    stim[24] = 70'h199341d94dcf6869b7;
    stim[25] = 70'h101792e8edd6acc5a3;
    stim[26] = 70'h0f1b046989547d9500;
    stim[27] = 70'h0fd0599bc6d6906148;
    stim[28] = 70'h0d1e6e766cdec1ba7c;
    stim[29] = 70'h12da38a19b78f7940a;
    stim[30] = 70'h1a87ac9c351d5fe73e;
    stim[31] = 70'h1d2b3cb7281ef08f92;
    stim[32] = 70'h0951e5834f327a5910;
    stim[33] = 70'h1e3e89a9493d3ebb04;
    stim[34] = 70'h0cfcd284f4eee89864;
    stim[35] = 70'h3f6acabf1ce9337c78;
    stim[36] = 70'h06a71455a9b4ed0672;
    stim[37] = 70'h1337055205cfb207a1;
    stim[38] = 70'h0c9dab26f4f0bd6c39;
    stim[39] = 70'h0d490d5df024ad3f26;
    stim[40] = 70'h073532833e94538236;
    stim[41] = 70'h0455cc6c49f2459177;
    stim[42] = 70'h0a586d0105f8a0a988;
    stim[43] = 70'h0b41a640132b2f3d55;
    stim[44] = 70'h06a2fcbcfcd315798c;
    stim[45] = 70'h3a1e850a3988dfca1c;
    stim[46] = 70'h1de1389defc319a871;
    stim[47] = 70'h058ef58a024abc4668;
    stim[48] = 70'h171ec5ffc3efd2d038;
    stim[49] = 70'h02eff956133e263265;
    stim[50] = 70'h00bcb8cc57710a0d6d;
    stim[51] = 70'h0aed253879f24b6324;
    stim[52] = 70'h0f2f65681de5a35ea8;
    stim[53] = 70'h1d99c098f3957539d3;
    stim[54] = 70'h102e4a852d627c74c4;
    stim[55] = 70'h153ccd3584d4c06ad6;
    stim[56] = 70'h1efdc26e2b39d5deac;
    stim[57] = 70'h08196f4ae5d8a42d41;
    stim[58] = 70'h1e9175bd9ea7bac53d;
    stim[59] = 70'h1187c439b1b028618d;
    stim[60] = 70'h018c545d1361324b0c;
    stim[61] = 70'h0289f1c124c4aadf97;
    stim[62] = 70'h0eece5dba1c6e903a5;
    stim[63] = 70'h102e8321e84cc8385a;
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
      expv[0] = 33'h1b4fd2c01;
      expv[1] = 33'h1888b301d;
      expv[2] = 33'h0aa55c17a;
      expv[3] = 33'h1ced61c0c;
      expv[4] = 33'h09ce014ce;
      expv[5] = 33'h19503e421;
      expv[6] = 33'h17e39018e;
      expv[7] = 33'h0e6921602;
      expv[8] = 33'h06954a3db;
      expv[9] = 33'h1201c6158;
      expv[10] = 33'h056c041f4;
      expv[11] = 33'h17802499c;
      expv[12] = 33'h00a753cd8;
      expv[13] = 33'h017bbfc66;
      expv[14] = 33'h15a7c8e4e;
      expv[15] = 33'h17ad52573;
      expv[16] = 33'h1c14efdf4;
      expv[17] = 33'h0305ca904;
      expv[18] = 33'h0e8529ee0;
      expv[19] = 33'h01a75e499;
      expv[20] = 33'h15840feb6;
      expv[21] = 33'h1f6fde80e;
      expv[22] = 33'h0bcc1634c;
      expv[23] = 33'h1515f1944;
      expv[24] = 33'h1cf6869b6;
      expv[25] = 33'h1d6acc5a2;
      expv[26] = 33'h1547d9500;
      expv[27] = 33'h0d6906148;
      expv[28] = 33'h0dec1ba7c;
      expv[29] = 33'h178f7940a;
      expv[30] = 33'h11d5fe73e;
      expv[31] = 33'h01ef08f93;
      expv[32] = 33'h1327a5910;
      expv[33] = 33'h13d3ebb05;
      expv[34] = 33'h0eee89864;
      expv[35] = 33'h0e9337c78;
      expv[36] = 33'h1b4ed0672;
      expv[37] = 33'h1cfb207a0;
      expv[38] = 33'h0f0bd6c38;
      expv[39] = 33'h024ad3f26;
      expv[40] = 33'h094538236;
      expv[41] = 33'h1f2459176;
      expv[42] = 33'h1f8a0a988;
      expv[43] = 33'h12b2f3d54;
      expv[44] = 33'h0d315798c;
      expv[45] = 33'h188dfca1d;
      expv[46] = 33'h1c319a870;
      expv[47] = 33'h04abc4668;
      expv[48] = 33'h1efd2d038;
      expv[49] = 33'h13e263264;
      expv[50] = 33'h1710a0d6c;
      expv[51] = 33'h1f24b6324;
      expv[52] = 33'h1e5a35ea8;
      expv[53] = 33'h1957539d2;
      expv[54] = 33'h1627c74c4;
      expv[55] = 33'h0d4c06ad6;
      expv[56] = 33'h139d5deac;
      expv[57] = 33'h1d8a42d40;
      expv[58] = 33'h0a7bac53c;
      expv[59] = 33'h1b028618c;
      expv[60] = 33'h161324b0c;
      expv[61] = 33'h0c4aadf96;
      expv[62] = 33'h1c6e903a4;
      expv[63] = 33'h04cc8385b;
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
