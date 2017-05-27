function [ idx ] = parseBrac( inputVec, brac, varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    disp('Entered parseBrac:');

    switch brac
        case {'{','}'}
            left = '{';
            right = '}';
        case {'(',')'}
            left = '(';
            right = ')';
        case {'[',']'}
            left = '[';
            right = ']';
    end

    if ~isempty(varargin)
        idx = varargin{1,1};
    else
        idx = 1;
    end

    n = length(inputVec);
    while idx < n
        current = inputVec(idx);
        disp(idx);
        disp(current);
        if inputVec(idx) == left
            idx = parseBrac(inputVec,brac,idx + 1);
        elseif inputVec(idx) == right
            idx = idx + 1;
            disp('Exiting parseBrac');
            return
        else
            idx = idx + 1;
        end
    end

    disp('Reached end of input!');
end

